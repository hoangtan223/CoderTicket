class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :order_details

  before_create :check_duplicates

  def check_duplicates
    if TicketType.exists?(event: event, price: price)
      errors.add(:base, "cannot have duplicates")
    end
  end

  def remaining_tickets
    sold_quantity = order_details.sum(:quantity)
    max_quantity - sold_quantity
  end

  def enough_quantity?(quantity)
     remaining_tickets - quantity < 0 ? false : true
  end
end
