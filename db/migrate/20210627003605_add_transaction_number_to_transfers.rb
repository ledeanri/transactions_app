class AddTransactionNumberToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :transaction_number, :string
  end
end
