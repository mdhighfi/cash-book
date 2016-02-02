class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :description
      t.string :type, null: false, index: true
      t.float :apr, null: false
      t.float :min_payment, null: false
      t.integer :credit, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
