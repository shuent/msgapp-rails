class FriendsController < ApplicationController

  def index
    @friends = current_user.friends
    
    # 友達リスト
  end
  def new
    @friend = User.search_by_username(params.permit(:searching_name)[:searching_name])
    # binding.pry
    # 追加時のpage
  end
  def create
    # binding.pry
    @friendship = Friendship.new(friend_id: params[:friend_id], user_id: current_user.id)
    if @friendship.save
      redirect_to friends_path
    else
      redirect_to friends_path,notice: "Already your friend"
    end

    # else
    #   redirect_to friends_path
    # end
    # index にredirect
    
  end

  private

end
