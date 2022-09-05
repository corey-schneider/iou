module BillHelper
  def paid_or_owes(bill)
    bill.paid? ? 'paid' : 'owes'
  end
end
