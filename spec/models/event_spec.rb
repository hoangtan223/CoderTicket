require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:venue) {venue = build(:venue)}
  let(:category) {category = build(:category)}
  let(:event) { event = build(:event, starts_at: 2.days.from_now, name: "event 1", venue: venue, category: category) }
  describe ".upcoming_events" do
    it "should return active record relation" do
      expect(Event.upcoming_events).to be_a ActiveRecord::Relation
    end

    it "should return events order by start_at " do

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
      nil_event = Event.new
      expect(nil_event.venue_name).to be_nil
    end

    it "should returns venue's name if there's a venue"  do
      event.venue = Venue.new(name: "RMIT")
      expect(event.venue_name).to eq 'RMIT'
    end
  end

  describe ".search_by_name" do
    it "should return active record relation" do
      expect(Event.search_by_name("test")).to be_a ActiveRecord::Relation
    end
    it "should return no record if there is no matched records" do
      event.name = "Việt Nam test"
      event.save

      expect(Event.search_by_name("abc").count).to eq 0
    end

    it "should return matched records" do
      event.name = "Việt Nam test"
      event.save

      expect(Event.search_by_name("việt nam").count).to eq 1
    end
  end

  describe ".is_out_of_date?" do
    before(:each) do
      @event = Event.new(starts_at: 1.days.ago)
    end

    it "should return true if start date of event is in the past" do
      puts "===> a: #{(@event.starts_at < Time.now).inspect}"
      expect(@event.is_out_of_date?).to eq true
    end

  end
end
