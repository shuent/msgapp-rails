class RemoveObjsFromConversations < ActiveRecord::Migration[5.0]
  def change
    remove_column :conversations, :recipient_id, :integer
    remove_column :conversations, :sender_id, :integer
  end
end
