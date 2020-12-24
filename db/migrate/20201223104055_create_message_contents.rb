class CreateMessageContents < ActiveRecord::Migration[6.0]
  def change
    create_table :message_contents do |t|
      t.string  :content, null: false
      t.integer :feeling_id, null: false
      t.integer :favo, null: false
      t.references :chara, foreign_key: true
      t.timestamps
    end
  end
end
