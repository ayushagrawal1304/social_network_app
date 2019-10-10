class Users::PostsController < ApplicationController
  #before_action :load_community, only: :create

  def index
    @community = Community.find(params[:community_id])
    @post = @community.posts.order('created_at DESC')
              .paginate(:page => params[:page], :per_page => PER_PAGE)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.community_id = params[:community_id]
    if @post.save 
      flash.notice = "Post has been created successfuly"
      redirect_to users_community_post_path(@post.community_id, @post.id)
    else
      render "show"
    end
  end

  private

  def post_params
    params.permit(:title, :content, attachments: [])
  end

  def load_community
    binding.pry
    @community = current_user.communities.find_by(id: params[:community_id])
    if @community.blank?
      flash.error = "unknown community"
      redirect_to 
      end   
  end
end
