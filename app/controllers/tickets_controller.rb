class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    if @event.is_out_of_date?
      flash[:error] = "Booking closed! The event is started"
      redirect_to new_event_ticket_path
    end
    
    ticket_quantity = params[:ticket_quantity]

  end
end
