class Bill < ApplicationRecord
  belongs_to :user

  # Required params
  validates_presence_of :title, :amount, :paid, :transaction_date
end
