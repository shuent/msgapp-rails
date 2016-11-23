# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! body: data['message']
  end
end
