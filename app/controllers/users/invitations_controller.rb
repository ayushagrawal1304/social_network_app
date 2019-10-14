class Users::InvitationsController < ApplicationController
  def create
    params[:user_ids].each do |user_id|
      @approval = UserApproval.new(approval_params)
      @approval.user_id = user_id
      if @approval.save
        UsermailMailer.invite_user_email(User.find(user_id)).deliver_later
      end
    end
    flash.notice = "Invited Successfuly"
    redirect_to my_communities_users_dashboard_path(params[:community_id])
  end

  def index
    @communities=current_user.communities.not_approved
                          .paginate(:page => params[:page], :per_page => PER_PAGE)
  end

  def accept
    if UserApproval.find_by(id: params[:id]).update(approved: true)
      flash.notice = "Accepted successfuly"
      redirect_to users_invitations_path
    else
      render 'index'
    end
  end

  def decline
    @approval = UserApproval.find(params[:id])
    respond_to do |format|
      format.js
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
