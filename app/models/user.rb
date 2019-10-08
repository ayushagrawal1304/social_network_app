class User < ApplicationRecord
  has_and_belongs_to_many :communities
  has_many :posts
  has_many :approvals
  has_one_attached :image
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, length: { maximum: 20 },
            format: { with: /\A[a-zA-Z]+\z/, message: "only includes charcaters " }

  validates :last_name, length: { maximum: 20 },
            format: { with: /\A[a-zA-Z]+\z/, message: "only includes charcaters " }

  validates_format_of :mobile_no,length: { minimum: 10 }, :with =>  /\d[0-9]\)*\z/ ,
     message: "Invalid "

  scope :except_current_user, -> (user_id) { where.not(id: user_id) }
  scope :invite_users, -> (com_id) { where.not(id: (UserApproval.select(:user_id).where(community_id: com_id))) }
  scope :user_name, -> (u_id) { select(:first_name).where(id: u_id )}
  #validates :password_confirmation, :presence =>true
  #validates_confirmation_of :password
end
