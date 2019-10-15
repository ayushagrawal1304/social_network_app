module Users::CommentsHelper
  def comments(commentable_id)
    Comment.find_by(id: commentable_id)
  end
end
