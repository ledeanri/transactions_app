class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @user = current_user
  end

  def create
    @account = Account.new(params.require(:account).permit(:amount))
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
  end
end
