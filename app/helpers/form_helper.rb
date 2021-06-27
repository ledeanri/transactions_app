module FormHelper
  def setup_deposit(deposit)
    deposit.account ||= Account.new
    deposit
  end
end
