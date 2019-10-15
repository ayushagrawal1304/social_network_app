class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :likes, as: :likable
  belongs_to :user

  scope :get_comments, -> (commentable_id) { Comment.where(commentable_id: commentable_id)
                                                        .order('created_at DESC') }
end
