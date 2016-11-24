
class Conversation < ApplicationRecord
  has_many :user_conversations
  has_many :users, through: :user_conversations
  has_many :messages


  def partner(yourself)
    # todo
    # yourselfをdeleteせずにyourselfだけを除く残りのUsersを配列で返す
    users.first == yourself ? users.second : users.first
  end

end
