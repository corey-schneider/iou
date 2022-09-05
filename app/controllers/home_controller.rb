class HomeController < ApplicationController
  def index
    @bills = Bill.all
    @sorted_bills = Bill.order(:transaction_date)
  end
end
