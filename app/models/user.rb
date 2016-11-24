class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :user_conversations
  has_many :conversations, through: :user_conversations


  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true,
    length: { minimum: 6 }, if: -> { new_record? || changes["password"] }

  def self.search_by_username(usernam)
    User.find_by(username: usernam)
  end
end
