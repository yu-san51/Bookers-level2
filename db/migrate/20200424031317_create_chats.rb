class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
    	t.integer :user_id, null: false
    	t.integer :room_id, null: false
    	t.text :content, null: false
        t.timestamps
    end
  end
end
