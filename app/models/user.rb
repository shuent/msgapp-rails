class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :friendships
  has_many :friends, through: :friendships
  
  has_many :conversations_of_sender,:class_name => 'Conversation', :foreign_key => 'sender_id'
  has_many :conversations_of_recipient,:class_name => 'Conversation', :foreign_key => 'recipient_id'

  def conversations
    conversations_of_recipient + conversations_of_sender
  end

  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true,
    length: { minimum: 6 }, if: -> { new_record? || changes["password"] }
end
