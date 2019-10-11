class Users::LikesController < ApplicationController
  def create

    @user_existing_like = current_user.likes.where(likable_id: params[:post_id])
    if @user_existing_like.present?
      @user_existing_like[0].destroy
      redirect_to users_community_post_path(params[:community_id], params[:post_id])
    else
      @like = current_user.likes.new
      @like.likable_id = params[:post_id]
      @like.likable_type = "Post"
      if @like.save
        redirect_to users_community_post_path(params[:community_id], params[:post_id])
      else
        render "post/show"
      end
    end

  end
end
