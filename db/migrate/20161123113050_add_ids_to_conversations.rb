class AddIdsToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :user_id, :integer
    add_column :conversations, :recipient_id, :integer
  end
end
