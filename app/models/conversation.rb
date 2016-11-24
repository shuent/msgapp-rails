class Conversation < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  has_many :messages

  validates :recipient_id, {uniqueness: { scope: :sender_id}, presence: true}


  # def self.partner(current_user)
  #   Conversation.recipient == current_user ? Conversation.sender : Conversation.recipient
  # end
end
