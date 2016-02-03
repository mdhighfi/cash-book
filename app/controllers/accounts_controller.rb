class AccountsController < ApplicationController
  validates :name, :type, :apr, :min_payment, :credit,
            :user_id, :created_at, :updated_at, presence: true

  belongs_to :user
end
