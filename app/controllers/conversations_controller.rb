class ConversationsController < ApplicationController
  before_action :show_cu, only: [:show]

  def index
    @conversations = current_user.conversations.includes(:messages).includes(:users)
    # binding.pry
    # home画面、メッセージ一覧

  end

  def find_or_new
    q = Conversation.joins(:users).where(users: {id: current_user.id}) & Conversation.joins(:users).where(users: {id: params[:friend_id].to_i})
    if q = q.first
      redirect_to action: :show, id: q.id
    else
      con = Conversation.create
      con.users << current_user
      con.users << User.find(params[:friend_id].to_i)
      redirect_to action: :show, id: con.id
    end
    # binding.pry

  end

  def show
  end

  private
  def show_cu
    if @conversation = Conversation.includes(:users).find_by_id(params[:id])
      redirect_to action: :index unless @conversation.users.include?(current_user)
      @messages = @conversation.messages.includes(:sender)
      # new message
      @message = Message.new
    else
      redirect_to action: :index
    end
  end


end
