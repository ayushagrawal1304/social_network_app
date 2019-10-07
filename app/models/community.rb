class Community < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts
  has_many :user_approvals
  has_one_attached :image

  scope :community_name, -> (community_id){select(:name).where(id: community_id)}
  scope :joined_communities, -> (current_user_id){ where(id: (UserApproval.select(:community_id).where(user_id: current_user_id).where(approved: true))) }
end
