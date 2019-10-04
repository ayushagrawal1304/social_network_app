class Users::DashboardsController < ApplicationController
  def index
    @community=Community.where(user_id: current_user.id)
  end

  def my_communities
    @community=Community.where(user_id: current_user.id)
  end

  def joined_communities
  end

end
