class DropWithdrawalsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :Withdrawals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
