class FriendsController < ApplicationController

  def index
    @friends = current_user.friends.all
    # 友達リスト
  end
  def new
    @friend = User.search_by_username(params.permit(:searching_name)[:searching_name])
    # binding.pry
    # 追加時のpage
  end
  def create
    # binding.pry
    if Friendship.create(friend_id: params[:friend_id], user_id: current_user.id)
      redirect_to friends_path
    else
      redirect_to new_friend_path
    end
    # index にredirect
    
  end

  private
  def friendship_params
    params.require(:friendship).permit(:friend_id).merge(user_id: current_user.id)
  end

end
