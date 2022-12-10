class FriendsController < ApplicationController
  before_action :find_current_user

  def index; end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)

    @friend.user_id = @user.id

    if @friend.save
      redirect_to user_friends_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @friend = Friend.find_by(user_id: params[:user_id], friend_id: params[:id])
    @friend.destroy

    redirect_to user_friends_path, status: :see_other
  end

  def find_current_user
    @user = User.find(params[:user_id])
  end

  private

  def friend_params
    params.require(:friend).permit(:user_id, :friend_id)
  end
end
