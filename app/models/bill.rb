class Bill < ApplicationRecord
  belongs_to :user

  # Required params
  validates_presence_of :title, :amount, :transaction_date
  validate :check_users

  protected

  def check_users
    errors.add(:user_id, 'This user cannot owe/pay themselves') if user_id == person2_id
  end
end
