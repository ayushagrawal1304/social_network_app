class UsermailMailer < ApplicationMailer
  def invite_user_email(user_id)
      @user = User.find(user_id)
      mail(to: @user.email, subject: 'communitity invitation')
   end
end
