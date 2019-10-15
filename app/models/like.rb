class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user
  scope :user_like, -> (user,likable_id) {user.likes.where(likable_id: likable_id)}
  scope :get_like_users, -> (likable_id){ where(likable_id: likable_id)
                                        .order('created_at DESC').map(&:user_id)}
end
