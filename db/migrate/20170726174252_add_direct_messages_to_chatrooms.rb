class AddDirectMessagesToChatrooms < ActiveRecord::Migration[5.0]
  def change
  	add_column :chatrooms, :direct_messages, :boolean , default: false
  end
end
