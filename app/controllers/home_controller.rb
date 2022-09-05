class HomeController < ApplicationController
  def index
    @bills = Bill.all
    @sorted_bills = Bill.order(transaction_date: :desc)
    @grouped_bills = Bill.select(:transaction_date, 'array_agg(id)')
                         .group(:transaction_date)
                         .order(transaction_date: :desc)
                         .pluck(:transaction_date, 'array_agg(id)')
    # @grouped_bills_hash = Hash[*@grouped_bills.flatten(1)]
  end
end
