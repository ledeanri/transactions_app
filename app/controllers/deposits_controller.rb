class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
  end

  def create
    #byebug
    @deposit = Deposit.new
    @account = Account.find_by(account_number: params[:deposit][:account_attributes][:account_number])
    @deposit.account = @account
    @deposit.amount = params[:deposit][:amount]
    puts @deposit.amount
    if @deposit.save
      @balance = Balance.new
      @balance.deposit = @deposit
      @balance.account = @deposit.account
      @balance.save
      @account.amount += @deposit.amount
      @account.save
      flash[:notice] = "Success"
      redirect_to new_deposit_path(@deposit)
    else
      render :new
    end
  end
end
