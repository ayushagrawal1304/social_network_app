class Users::DashboardsController < ApplicationController
  def index
    @community=Community.where(user_id: current_user.id)
  end
end
