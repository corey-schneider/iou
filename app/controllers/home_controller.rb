class HomeController < ApplicationController
  def index
    @bills = Bill.all
  end
end
