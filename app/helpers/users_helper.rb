module UsersHelper
  def follow_or_cancel(id)
    if follower ||=Follower.find_by(user_id: current_user.id, follower_id: id)
      link_to "取消追蹤", follower_path(follower.id), method: :delete, class: "waves-effect waves-light btn"
    else
      link_to "追蹤", follower_apply_forms_path(id: id), method: :post, class: "waves-effect waves-light btn"
    end
  end

  def friend_or_cancel(id)
    if Friend.find_by(user_id: current_user.id, friend_id: id)
      link_to "刪除好友", friend_path(id), method: :delete, class: "waves-effect waves-light btn"
    elsif apply_for_friend ||= FriendApplyForm.find_by(user_id: current_user.id, apply_id: id)
      link_to "取消申請", friend_apply_form_path(apply_for_friend.id), method: :delete, class: "waves-effect waves-light btn"
    else
      link_to "申請好友", friend_apply_forms_path(id: id), method: :post, class: "waves-effect waves-light btn"
    end
  end

  def find_friend_from_chatroom(chatroom)
    user = chatroom.chatroom_groups.map{|val| val.user if val.user != current_user}.compact.first
    return user
  end
end
