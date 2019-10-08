class Users::Communities::PostsController < ApplicationController
  def show
    @community = Community.find(params[:id])
    @post = Post.where(community_id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.community_id = params[:community_id]
    if @post.save 
      flash.notice = "Post added Successfuly"
      redirect_to users_communities_post_path(@post.community_id)
    else
      render "show"
    end
  end

  def post_params
    params.require(:post).permit(:description, :attachments => [])
  end
end
