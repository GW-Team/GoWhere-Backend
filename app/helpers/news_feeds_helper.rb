module NewsFeedsHelper
  def follow_or_cancel(id)
    if follower ||=Follower.find_by(user_id: current_user.id, follower_id: id)
      button_to "取消追蹤", follower_path(follower.id), method: "delete"
    else
      button_to "追蹤", follower_apply_form_path(id), method: "put"
    end
  end
end
