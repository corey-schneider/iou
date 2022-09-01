module UserHelper
  def initials(user)
    user.first_name[0] + user.last_name[0]
  end
end
