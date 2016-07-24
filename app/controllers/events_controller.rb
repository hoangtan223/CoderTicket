class EventsController < ApplicationController
  def index
    puts "===> a: #{(params[:search]).inspect}"
    @events = Event.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
  end
end
