module ApplicationHelper
  def number_of_accounts
    Account.count
  end

  def number_of_users
    User.count
  end

  def get_account
    @account = Account.find_by(user: current_user)
    if @account.nil?
      @account = Account.new
      @account.user = current_user
      @account.save
    end
    @account
  end
end
