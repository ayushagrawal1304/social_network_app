module UsersHelper
  def invite_user_options
    User.invite_users(@community.id).except_current_user(current_user).map { |user| [user.email, user.id ] }
  end
end
