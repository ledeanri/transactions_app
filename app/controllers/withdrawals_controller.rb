class WithdrawalsController < ApplicationController
  def new
    @withdrawal = Withdrawal.new
  end

  def create
    @withdrawal = Withdrawal.new
    @account = Account.find_by(user: current_user)
    @withdrawal.account = @account
    @withdrawal.amount = params[:withdrawal][:amount]
    @account.amount -= @withdrawal.amount
    if @withdrawal.save
      @balance = Balance.new
      @balance.withdrawal = @withdrawal
      @balance.account = @withdrawal.account
      @balance.save
      @account.save
      flash[:notice] = "Success"
      redirect_to new_withdrawal_path(@withdrawal)
    else
      render :new
    end
  end
end
