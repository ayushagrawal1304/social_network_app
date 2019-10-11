class Users::PostsController < ApplicationController
  before_action :load_community, only: [:create, :index]

  def index
    @community = Community.find(params[:community_id])
    @post = @community.posts.order('created_at DESC')
              .paginate(:page => params[:page], :per_page => PER_PAGE)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order('created_at DESC')
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
    @community = Community.includes(:user_approvals)
    .where(user_approvals: { approved:  true, user_id: current_user.id})+Community.where(user_id: current_user.id)
    if !@community.map(&:id).include? params[:community_id].to_i
      flash[:error] = "unknown community"
      redirect_to users_dashboards_index_path
    end   
  end
end
