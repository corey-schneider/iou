module FriendHelper
  def add_or_remove_friend(user, friend_user)
    if user.friends.find_by(friend_id: friend_user.id)
      show_unfriend_link(user.id, Friend.find_by(user_id: user.id, friend_id: friend_user.id).id)
    else
      show_add_friend_link(user.id, friend_user.id)
    end
  end

  def show_unfriend_link(user_id, friend_id)
    link_to 'unfriend',
            user_friend_path(user_id: user_id, id: friend_id),
            data: {
              turbo_method: :delete,
              turbo_confirm: 'Are you sure you want to remove this friend?'
            }
  end

  def show_add_friend_link(user_id, friend_id)
    link_to 'add friend',
            user_friends_path(friend: { user_id: user_id, friend_id: friend_id }),
            data: {
              turbo_method: :post
            }
  end
end
