require 'rails_helper'

RSpec.describe "events/show", type: :view do
  let(:region) {region = Region.create(name: 'Ho Chi Minh')}
  let(:venue) {venue = Venue.create(name: "RMIT", full_address: "123 test", region_id: region.id)}
  let(:category) {category = Category.create(name: "Entertainment")}
  let(:event) {event = create(:event, venue: venue, category: category, starts_at: 1.days.from_now)}

  it "should route with event path" do
    event.save!
    controller.extra_params = {:id => event.to_param}

    expect(controller.request.fullpath).to eq event_path(event)
  end

=begin
  it "should render requested event" do
    event = Event.create!(name: "test name", venue_id: venue.id, category_id: category.id,starts_at: 1.days.from_now,
                      extended_html_description: "<h1>hello</h1>" )
    event.ticket_types << TicketType.create(name: "test ticket", price: 999.00)

    event.save!
    puts "===> a: #{(event.id).inspect}"
    controller.extra_params = {:id => event.to_param}

    render
    expect(rendered).to match /event.name/
  end
=end
end