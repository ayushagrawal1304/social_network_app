class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user
  scope :user_like, -> (user,likable_id) {user.likes.where(likable_id: likable_id)}
end
