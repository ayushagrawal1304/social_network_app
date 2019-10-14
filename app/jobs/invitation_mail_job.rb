class InvitationMailJob < ApplicationJob
  queue_as :default

  def perform(user_ids)
    user_ids.each do|user_id|
      UsermailMailer.invite_user_email(user_id).deliver
    end  
  end
end
