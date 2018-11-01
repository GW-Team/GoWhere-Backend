module ApplicationHelper


  def find_fullname(id)
    user = find_user(id)
    "#{user.first_name} #{user.last_name}"
  end

  def find_user(id)
    User.find_by(id: id)
  end

  def get_chatrooms
    chatroom_ids = current_user.chatroom_groups.map{|group| group.chatroom_id}
    chatrooms = Chatroom.includes(chatroom_groups: :user).where("id in (?)", chatroom_ids)
    @groups  = chatrooms.map{|chatroom| chatroom if chatroom.is_group}.compact
    @friends = chatrooms.map{|chatroom| chatroom unless chatroom.is_group}.compact
  end

  def user_avatar(user)
    if user.avatar.file.nil?
      "default_avatar.png"
    else
      user.avatar.thumb.url
    end
  end

  def chatroom_avatar(chatroom)
    if chatroom.picture.file.nil?
      "default_group.png"
    else
      chatroom.picture.thumb.url
    end
  end

  def news_feed_picture(news_feed)
    (news_feed.picture.file.nil?) ? "aircraft.jpg" : news_feed.picture.resize.url 
  end

  def link_use_i_tag(icon_name, link, use_method, class_name)
    link_to content_tag(:i, icon_name, :class => "material-icons"), link, method: use_method, class: class_name
  end
end
