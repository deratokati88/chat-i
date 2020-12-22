class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :favo, null: false
      t.integer :user_id, null:false
      t.integer :chara_id, null:false
      t.timestamps
    end
  end
end
