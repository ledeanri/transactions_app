module FormHelper
  def setup_deposit(deposit)
    deposit.account ||= Account.new
    deposit
  end
  def setup_transfer(transfer)
    transfer.account ||= Account.new
    transfer
  end
end
