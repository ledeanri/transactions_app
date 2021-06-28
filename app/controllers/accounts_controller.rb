class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @user = current_user
  end

  def create
    @account = Account.new
    @account.user = current_user
    @account.save
    redirect_to root_path
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @tarefa = Account.find(params[:id])
    @tarefa.update(params.require(:account).permit(:user, :amount))
    redirect_to root_path
  end

  def show
    @account = Account.find_by_id(params[:id])
    @start = selected_date(:start_date)
    @end = selected_date(:end_date)
    @deposits = Deposit.where(:created_at => @start.beginning_of_day..@end.end_of_day, account: @account)
    @withdrawals = Withdrawal.where(:created_at => @start.beginning_of_day..@end.end_of_day, account: @account)
    @transfers = Transfer.where(:created_at => @start.beginning_of_day..@end.end_of_day, account: @account)
    #byebug
  end

  def selected_date(symbol)
    params[:search].present? && params[:search][symbol].present? ? params[:search][symbol].to_date : Time.current.to_date
end
end
