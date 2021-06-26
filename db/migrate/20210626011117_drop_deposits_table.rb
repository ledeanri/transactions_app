class DropDepositsTable < ActiveRecord::Migration[5.2]
    def up
    drop_table :deposits
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
