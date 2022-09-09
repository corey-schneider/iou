class BillsController < ApplicationController
  before_action :find_current_bill, only: %i[show edit update destroy]

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @bill = Bill.new
  end

  def edit
  end

  def create
    @bill = Bill.new(bill_params)

    @bill.user = current_user

    if @bill.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bill.update(bill_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
    redirect_to root_path, status: :see_other
  end

  def find_current_bill
    @bill = Bill.find(params[:id])
  end

  private

  def bill_params
    params.require(:bill).permit(
      :title, :description, :amount, :paid, :paid_on, :paid_via, :transaction_date,
      :user_id, :person2_id
    )
  end
end
