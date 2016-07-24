class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :ticket_type_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
