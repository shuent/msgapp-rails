class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.body,
        sender: message.sender.username
      head :ok
    else
      redirect_to conversations_path
    end
    # binding.pry
    # do some stuff

    # redirect_back(fallback_location: conversation_path(params[:conversation_id]))
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(conversation_id: params[:conversation_id] ,sender_id: current_user.id,is_read: false)
  end
end

