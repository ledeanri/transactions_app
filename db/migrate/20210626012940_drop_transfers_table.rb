class DropTransfersTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :transfers
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
