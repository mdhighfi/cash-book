class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false, index: true
      t.integer :item_id, null: false, index: true
      t.datetime :date, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
