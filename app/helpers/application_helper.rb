module ApplicationHelper
  def find_fullname(id)
    user = find_user(id)
    user.first_name + user.last_name
  end

  def find_user(id)
    User.find_by(id: id)
  end
end
