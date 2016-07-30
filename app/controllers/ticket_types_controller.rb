class TicketTypesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @type = TicketType.new(event: @event)
  end

  def create
    @type = TicketType.new ticket_type_params

    if @type.save
      flash[:success] = "#{@type.name} created!"
      redirect_to event_path(@type.event_id)
    else
      flash[:error] = @type.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private

  def ticket_type_params
    params.require(:ticket_type).permit(:name, :price, :max_quantity, :event_id)
  end
end
