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

  def index
    @approvals=UserApproval.where(user_id: current_user.id).where(approved: false)
  end

  def accept
    if UserApproval.find_by(id: params[:id]).update(approved: true)
      redirect_to users_invitations_path
    else
      render 'index'
    end
  end

  def destroy
    @approval = UserApproval.find(params[:id])
    @approval.destroy
    redirect_to users_invitations_path
  end

  def approval_params
    params.permit(:user_id, :community_id)
  end
end
