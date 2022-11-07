class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_addrress
      t.string :shipping_postal_code
      t.string :shipping_name
      t.integer :postage
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
