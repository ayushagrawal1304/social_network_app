module UsersHelper
  def invite_user_options(community_id)
    User.invite_users(community_id).except_current_user(current_user).map { |user| [user.email, user.id ] }
  end
end
