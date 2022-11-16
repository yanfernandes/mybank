class CreateWithdraws < ActiveRecord::Migration[7.0]
  def change
    create_table :withdraws do |t|
      t.references :account, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
