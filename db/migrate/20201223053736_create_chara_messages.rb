class CreateCharaMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chara_messages do |t|
      t.string  :content, null: false
      t.integer :feeling_id, null: false
      t.references :chara, foreign_key: true
      t.references :message, foreign_key: true
      t.timestamps
    end
  end
end
