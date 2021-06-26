class DropBalancesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :balances
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
