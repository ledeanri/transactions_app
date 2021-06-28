class TransfersController < ApplicationController
  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new
    @transfer_made = Transfer.new

    @account_receive = Account.find_by(account_number: params[:transfer][:account_attributes][:account_number])
    @account_made = Account.find_by(user: current_user)
#byebug
      @transfer.amount = params[:transfer][:amount]
      unless @account_receive.nil?
        @account_receive.amount += @transfer.amount
        @transfer.account = @account_receive
      end

      @transfer_made.amount = params[:transfer][:amount]
      unless @transfer_made.nil?
        @account_made.amount -= calcular_taxas(@transfer_made.amount)
        @transfer_made.account = @account_made
      end

    if @transfer_made.save && @transfer.save
      @balance = Balance.new
      @balance.transfer = @transfer_made
      @balance.account = @transfer_made.account
      @balance.save
      @account_made.save

      @balance = Balance.new
      @balance.transfer = @transfer
      @balance.account = @transfer.account
      @balance.save
      @account_receive.save
      flash[:notice] = "Success"
      redirect_to new_transfer_path(@transfer)
    else
      render :new
    end
  end

  def calcular_taxas(valor)
    Time.zone = "America/Sao_Paulo"
    #days = {0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday", 6 => "Saturday"}

    if valor > 1000
      valor += 10
    end
    time = Time.current
    if time.wday.to_i > 0 && time.wday.to_i < 6 && time.strftime("%H").to_i > 8 && time.strftime("%H").to_i < 19
      valor += 5
    else
      valor += 7
    end
    valor
  end
end
