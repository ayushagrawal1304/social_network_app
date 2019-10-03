class Community < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts
  has_many :approvals
  has_one_attached :image

  scope :community_name, -> (community_id){select(:name).where(id: community_id)}

end
