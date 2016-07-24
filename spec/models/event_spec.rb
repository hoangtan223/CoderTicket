require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { event = Event.new }
  describe ".upcoming_events" do
    it "should return active record relation" do
      expect(Event.upcoming_events).to be_a ActiveRecord::Relation
    end

    it "should return events order by start_at " do
      venue = create(:venue)
      category = create(:category)
      #event1 = Event.create!(starts_at: 1.days.from_now, venue: venue)
      #event2 = Event.create!(starts_at: 3.days.from_now, venue: venue)

      event1 = create(:event, starts_at: 2.days.from_now, name: "event 1", venue: venue, category: category)
      event2 = create(:event, starts_at: 1.days.from_now, name: "event 2", venue: venue, category: category)

      expect(Event.upcoming_events).to eq [event2, event1]
    end

    it "should left out the event that out of date" do
      venue = create(:venue)
      category = create(:category)
      event = create(:event, starts_at: 1.days.ago, venue: venue, category: category)

      expect(Event.upcoming_events.count). to eq 0
    end
  end

  describe "#venue_name" do
    it "returns nil if there's no venue" do
      expect(event.venue_name).to be_nil
    end

    it "should returns venue's name if there's a venue"  do
      event.venue = Venue.new(name: "RMIT")
      expect(event.venue_name).to eq 'RMIT'
    end

    it "should generate factory girl" do


    end
  end
end
