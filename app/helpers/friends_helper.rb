module FriendsHelper
  def add_friend(friend_id, form)
    current_user.friends_friend.create(user_id: friend_id)
    current_user.users_friend.create(friend_id: friend_id)
    chatroom = Chatroom.create
    chatroom.chatroom_groups.create(user_id: current_user.id)
    chatroom.chatroom_groups.create(user_id: friend_id)
    current_user.followers_follower.create! user_id: friend_id
    current_user.users_follower.create! follower_id: friend_id
    form.destroy
  end
end
