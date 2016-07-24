class OrderDetail < ActiveRecord::Base
  belongs_to :order_summary, class_name: "order"
  belongs_to :ticket_type
end
