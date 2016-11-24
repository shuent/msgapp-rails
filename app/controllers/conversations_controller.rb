class ConversationsController < ApplicationController

  def index
    @conversations = current_user.conversations
    # binding.pry
    # home画面、メッセージ一覧

  end

  def find_or_new_conv
    if q = Conversation.joins(:users).where(users: {id: [current_user.id,params[:friend_id].to_i]}).first
      redirect_to action: :show, id: q.id
    else
      con = Conversation.create
      con.users << current_user
      con.users << User.find(params[:friend_id].to_i)
      redirect_to action: :show, id: con.id
    end
    binding.pry

  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = Conversation.find(params[:id]).messages

    # new message
    @message = Message.new
  end

  def new
    
  end

  def create
    # @conversation = Conversation.find_or_initialize_by()
    redirect_to :show
  end

end
