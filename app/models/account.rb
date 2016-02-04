class Account < ActiveRecord::Base
  TYPES = ['credit', 'checking', 'savings', 'student_Loan',
           'personal_Loan', 'car_Loan', 'mortgage']

  validates :name, :type, :apr, :min_payment,
            :credit, :user_id, presence: true
  validates :type, inclusion: { in: TYPES }

  belongs_to :user
  has_many :balances
end
