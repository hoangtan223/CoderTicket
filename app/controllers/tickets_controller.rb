class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    if @event.is_out_of_date?
      flash[:error] = "Booking closed! The event is started"
      #render 'new'
      redirect_to new_event_ticket_path
      return
    end
    
    ticket_quantities = params[:ticket_quantity]
    @order = Order.new(event: @event)

    ticket_quantities.each do |ticket_type_id, quantity|
      ticket_type = TicketType.find(ticket_type_id)
      order_detail = OrderDetail.new(ticket_type_id: ticket_type_id, quantity: quantity)
      unless ticket_type.enough_quantity? order_detail.quantity
        flash[:error] = "There's only #{ticket_type.remaining_tickets} tickets left for #{ticket_type.name}"
        redirect_to new_event_ticket_path
        return
      end
      @order.order_details << order_detail
    end

    if @order.save
      redirect_to root_path
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      redirect_to new_event_ticket_path
    end
  end
end
