class ConversationsController < ApplicationController

  def index
    # home画面、メッセージ一覧
  end

  def show
    @messages = current_user.conversations.find(params[:id]).messages.all
  end

end
