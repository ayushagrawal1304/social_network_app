class Api::V1::Users::CommunitiesController < ApplicationController

  def new; end
  
  def create
    @community = Community.new(community_params)
    @community[:user_id] = current_user.id
    if @community.save
      render json: @community
    end
  end

  def show
    @community = Community.find(params[:id])
    render json: @community
  end

  def invite_user
    @community = Community.find(params[:id])
    render json: @community
  end

  private
  
  def community_params
    params.require(:community).permit(:name)
  end

end
