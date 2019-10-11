class Users::CommentsController < ApplicationController
  def create
    @comment= current_user.comments.new(comment_params)
    if params[:commentable_id].present? 
      @comment.commentable_id = params[:commentable_id]
      @comment.commentable_type = "Comment"
    else
      @comment.commentable_id=params[:post_id]
      @comment.commentable_type= "Post"
    end

    if @comment.save
      flash.notice = "Comment added successfuly"
      redirect_to users_community_post_path(params[:community_id], params[:post_id])
    else
      render "post/show"
    end
  end

  def nested_comments
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.permit(:comment)
  end
end
