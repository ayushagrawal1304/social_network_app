class Users::LikesController < ApplicationController
  def create
    @user_existing_like = current_user.likes.where(likable_id: params[:post_id])
    if @user_existing_like.present?
      @user_existing_like[0].destroy
    else
      @like = current_user.likes.new
      @like.likable_id = params[:post_id]
      @like.likable_type = "Post"
      @like.save
    end
    respond_to do |format|
      format.js
    end
  end

  def like_by
    respond_to do |format|
      format.js
    end
  end
end
