class Users::DashboardsController < ApplicationController
  def index
    @community=Community.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 6)
  end

  def my_communities
    @community=Community.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 6)
  end

  def joined_communities
    @communities=Community.joined_communities(current_user.id).paginate(:page => params[:page], :per_page => 6)
  end

end
