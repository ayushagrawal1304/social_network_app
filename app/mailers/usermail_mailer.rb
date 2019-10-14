class UsermailMailer < ApplicationMailer
  def invite_user_email(user)
      @user = user
      mail(to: @user.email, subject: 'communitity invitation')
   end
end
