class Users::InvitationsController < ApplicationController

  def create
    @approval = UserApproval.new(approval_params)
    @approval[:approved]= false

    params[:user_id].each do |x|
      @approval[:user_id]= x
      binding.pry
      @approval.save
      binding.pry
    end
    flash.notice = "Invited Successfuly"
    render "create"
  end

  def index
    @approvals=UserApproval.where(user_id: current_user.id).where(approved: false)
  end

  def accept
    if UserApproval.find_by(id: params[:id]).update(approved: true)
      flash.notice = "Accepted successfuly"
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
