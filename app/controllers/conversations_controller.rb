class ConversationsController < ApplicationController

  def index
    # home画面、メッセージ一覧
  end

  def show
    @messages = Message.all
  end

end
