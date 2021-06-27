class AddTransactionNumberToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :transaction_number, :string
  end
end
