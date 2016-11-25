class MessagesController < ApplicationController
  def create
    a = Message.create(message_params)
    # binding.pry
    redirect_back(fallback_location: conversation_path(params[:conversation_id]))
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(conversation_id: params[:conversation_id] ,sender_id: current_user.id,is_read: false)
  end
end

