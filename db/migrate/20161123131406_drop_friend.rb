class DropFriend < ActiveRecord::Migration[5.0]
  def change
    drop_table :friends
  end
end
