class ConversationsController < ApplicationController

  def index
    @conversations = current_user.conversations
  end

  def show
    binding.pry
    @messages = current_user.conversations
  end

end
