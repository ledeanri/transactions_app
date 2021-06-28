class BalancesController < ApplicationController

  before_action :load_balance, only: [:edit, :update]

  def index
    if params[:search] && params[:search][:dob].present?
      start_date, end_date = params[:search][:dob].split(' - ')
      @balance = Balance.having_dob_between(start_date, end_date)
    else
      byebug
      account = Account.find_by(user: current_user)
      @balance = Balance.find(account: account).order(:created_at)
    end
  end

  def new
    @balace = Balance.new
  end

  def create
    @balance = Balance.new(balance_params)
    if @balance.save
      redirect_to balances_path, notice: 'Balance Created Successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @balance.update(balance_params)
      redirect_to balances_path, notice: 'Balance has been updated Successfully.'
    else
      render :edit
    end
  end

  private def balance_params
    params.require(:balance).permit(:account, :dob)
  end

  private def load_balance
    @balance = Balance.find_by(id: params[:id])
    unless @balance
      redirect_to balances_path, notice: 'Balance not found.'
    end
  end

end
