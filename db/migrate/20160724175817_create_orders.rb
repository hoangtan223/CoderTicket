class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :event_id
      t.decimal :total_price

      t.timestamps null: false
    end
  end
end
