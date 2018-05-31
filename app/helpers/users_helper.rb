module UsersHelper
  def follow_or_cancel(id)
    if follower ||=Follower.find_by(user_id: current_user.id, follower_id: id)
      button_to "取消追蹤", follower_path(follower.id), method: :delete
    else
      button_to "追蹤", follower_apply_forms_path, method: :post, params: {id: id}
    end
  end

  def friend_or_cancel(id)
    if Friend.find_by(user_id: current_user.id, friend_id: id)
      button_to "刪除好友", friend_path(id), method: :delete
    elsif FriendApplyForm.find_by(user_id: id, apply_id: current_user.id)
      button_to "申請好友", friend_apply_forms_path, method: :get
    elsif apply_for_friend ||= FriendApplyForm.find_by(user_id: current_user.id, apply_id: id)
      button_to "取消申請", friend_apply_form_path(apply_for_friend.id), method: :delete
    else
      button_to "申請好友", friend_apply_forms_path, method: :post, params: {id: id}
    end
  end
end
