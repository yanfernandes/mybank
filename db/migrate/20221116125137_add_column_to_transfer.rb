class AddColumnToTransfer < ActiveRecord::Migration[7.0]
  def change
    add_column :transfers, :pending, :boolean, :default => true
  end
end
