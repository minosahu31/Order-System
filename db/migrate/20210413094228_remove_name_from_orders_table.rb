class RemoveNameFromOrdersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :name
  end
end
