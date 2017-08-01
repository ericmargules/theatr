class RemoveCcExpFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :cc_exp, :string
  end
end
