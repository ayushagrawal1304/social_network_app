class Users::InvitationsController < ApplicationController

  def create
    @approval = UserApproval.new(approval_params)
    @approval[:approved]= false
    if @approval.save
      redirect_back(fallback_location: root_path)
      #redirect_to users_community_path(params[:community_id]), flash: {success: "Invited successfully"}
    else 
      render 'dashboards/index'
    end
  end

  def approval_params
    params.permit(:user_id, :community_id)
  end
end
