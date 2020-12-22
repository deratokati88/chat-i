class CreateCharas < ActiveRecord::Migration[6.0]
  def change
    create_table :charas do |t|
      t.string :name,    null: false
      t.string :image,   null: false
      t.timestamps
    end
  end
end
