module HomeHelper
  def date
    return Date.today unless params.key?(:search) && params[:search] != 'all'

    Date.parse("#{params[:search][:month]}-1")
  end

  def bills
    params[:search] == 'all' ? Bill.all_grouped : Bill.from_month_grouped(date)
  end
end
