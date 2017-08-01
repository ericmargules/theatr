class AddCcExpToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cc_exp, :integer
  end
end
