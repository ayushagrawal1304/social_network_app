class User < ApplicationRecord
  has_many :user_approvals
  has_many :communities, through: :user_approvals
  has_many :posts
  has_many :comments
  has_many :likes
  has_one_attached :image

    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true ,length: { maximum: 20 },
            format: { with: /\A[a-zA-Z]+\z/, message: "only includes charcaters " }

  validates :last_name, presence: true, length: { maximum: 20 },
            format: { with: /\A[a-zA-Z]+\z/, message: "only includes charcaters " }

  validates :mobile_no, presence: true, length: { :minimum => 10, :maximum => 15 }, format: {:with =>  /\d[0-9]\)*\z/, message: "Invalid " }

  scope :except_current_user, -> (user_id) { where.not(id: user_id) }
  scope :invite_users, -> (com_id) { where.not(id: (UserApproval.select(:user_id).where(community_id: com_id))) }
  scope :user_name, -> (u_id) { select(:first_name).where(id: u_id )}
end
 