module FriendHelper
  def add_or_remove_friend(user, friend)
    return show_unfriend_link(user.id, friend.id) if user.friends.find_by(friend_id: friend.id)
    show_add_friend_link(user.id, friend)
  end

  def show_unfriend_link(user_id, friend_id)
    link_to 'unfriend',
    user_friend_path(user_id: user_id, id: friend_id),
    data: {
      turbo_method: :delete,
      turbo_confirm: "Are you sure you wish to remove this friend?"
    }
  end

  # TODO not working
  def show_add_friend_link(user_id, friend_id)
    link_to 'add friend', user_friends_path(friend_id: friend_id.id),
    data: {
      turbo_method: :post
    }
  end
end
