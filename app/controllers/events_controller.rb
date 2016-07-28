class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.search_by_name(params[:search])
    else
      @events = Event.upcoming_events
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @venues = Venue.all
    @categories = Category.all
  end

  def create
    @event = Event.new event_params
    puts "===> a: #{(@event.is_published).inspect}"
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_path
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      @venues = Venue.all
      @categories = Category.all
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :category_id, :venue_id,
                                  :hero_image_url, :extended_html_description, :is_published)
  end
end
