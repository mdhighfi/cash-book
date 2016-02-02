class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.string :frequency, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
