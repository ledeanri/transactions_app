class AddTransactionNumberToDeposits < ActiveRecord::Migration[5.2]
  def change
    add_column :deposits, :transaction_number, :string
  end
end
