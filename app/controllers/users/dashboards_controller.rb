class Users::DashboardsController < ApplicationController
  def index
    @community=Community.own_community(current_user.id)
                        .paginate(page: params[:page], per_page: PER_PAGE)
  end

  def my_communities
    @community=Community.own_community(current_user.id)
                        .paginate(page: params[:page], per_page: PER_PAGE)
  end

  def joined_communities
    @communities = current_user.communities.approved
                               .paginate(page: params[:page], per_page: PER_PAGE)
  end

end
