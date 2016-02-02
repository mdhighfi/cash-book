class CreateWishers < ActiveRecord::Migration
  def change
    create_table :wishers do |t|
      t.integer :list_id, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end

    add_index :wishers, [:list_id, :user_id], unique: true
  end
end
