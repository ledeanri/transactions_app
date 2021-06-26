class AddAmountToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :amount, :decimal
  end
end
