class Balance < ActiveRecord::Base
  validates :amount, :date, :account_id,
            :created_at, :updated_at, presence: true

  belongs_to :account
end
