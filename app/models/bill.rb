class Bill < ApplicationRecord
  belongs_to :user

  # Required params
  validates_presence_of :title, :amount, :transaction_date, :user_id, :person2_id

  validate :check_users

  default_scope { order(transaction_date: :desc) }

  scope :from_this_month, -> { where(transaction_date: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :from_month, ->(date) { where(transaction_date: date.beginning_of_month..date.end_of_month) }
  scope :from_month_grouped, lambda { |date|
    from_month(date)
      .select(:transaction_date, 'array_agg(id)')
      .group(:transaction_date)
      .order(transaction_date: :desc)
      .pluck(:transaction_date, 'array_agg(id)')
  }

  scope :all_grouped, lambda {
    select(:transaction_date, 'array_agg(id)')
      .group(:transaction_date)
      .order(transaction_date: :desc)
      .pluck(:transaction_date, 'array_agg(id)')
  }

  scope :owes, -> { where(paid: false) }
  scope :owed_to, ->(user) { where(person2_id: user.id, paid: false) }

  scope :paid, -> { where(paid: true) }
  scope :paid_amount, -> { paid.sum('bills.amount') }

  scope :owes_amount, -> { owes.sum('bills.amount') }

  protected

  def check_users
    errors.add(:user_id, 'This user cannot owe/pay themselves') if user_id == person2_id
  end
end
