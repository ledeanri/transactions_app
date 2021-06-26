class CreateWithdrawals < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawals do |t|
      t.references :account, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
