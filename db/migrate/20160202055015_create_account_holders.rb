class CreateAccountHolders < ActiveRecord::Migration
  def change
    create_table :account_holders do |t|
      t.integer :account_id, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end

    add_index :account_holders, [:account_id, :user_id], unique: true
  end
end
