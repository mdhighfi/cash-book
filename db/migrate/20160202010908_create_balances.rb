class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.float :amount, null: false
      t.datetime :date, null: false, index: true
      t.integer :account_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
