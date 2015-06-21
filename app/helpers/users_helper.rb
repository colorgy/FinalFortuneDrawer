module UsersHelper
  def user_path(user)
    "/users/#{user.id}"
  end
end
