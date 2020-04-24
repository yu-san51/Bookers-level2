class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

    	t.integer :user_id, null: false
    	t.integer :receive_id, null: false
        t.timestamps null:false
    end
  end
end