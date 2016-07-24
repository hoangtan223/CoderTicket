class EventsController < ApplicationController
  def index
    puts "===> a: #{(params[:search]).inspect}"
    if params[:search]
      @events = Event.search_by_name(params[:search])
    else
      @events = Event.upcoming_events
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
