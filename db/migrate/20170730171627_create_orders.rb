class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :showtime, foreign_key: true
      t.float :price
      t.string :email
      t.string :cc_num
      t.string :cc_exp

      t.timestamps
    end
  end
end
