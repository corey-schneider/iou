class FriendsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :find_current_user
  # load_and_authorize_resource

  def index; end

  def new
    @friend = Friend.new
    search if params[:search_query]
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
    # @friend = Friend.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friend = Friend.find(params[:id])
    @friend.destroy

    redirect_to user_friends_path, status: :see_other
  end

  def find_current_user
    @user = User.find(params[:user_id])
  end

  def search
    @results = User.where(
      # 'id LIKE :q OR email LIKE :q OR first_name LIKE :q OR last_name LIKE :q OR first_name AND last_name LIKE :q',
      "email ILIKE :q OR first_name ILIKE :q OR last_name ILIKE :q OR (first_name || ' ' || last_name ILIKE :q)",
      q: "%#{params[:search_query]}%"
    )
  end

  private

  def friend_params
    params.require(:friend).permit(:user_id, :friend_id, :search_query)
  end
end
