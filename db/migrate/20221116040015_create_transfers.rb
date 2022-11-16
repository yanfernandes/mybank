class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.decimal :amount

      t.timestamps
    end
  end
end
