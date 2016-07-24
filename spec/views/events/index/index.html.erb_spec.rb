require 'rails_helper'

RSpec.describe "events/index", type: :view do
  let(:venue) {venue = build(:venue)}
  let(:category) {category = build(:category)}

  before(:each) do
    assign(:events, [
        Event.create!(name: "event 1", starts_at: 1.days.from_now,venue: venue, category: category,extended_html_description: "<h1>hello</h1>"),
        Event.create!(name: "event 2", starts_at: 1.days.from_now,venue: venue, category: category,extended_html_description: "<h1>hello</h1>")
    ])
  end

  it "should display all events" do
    render
    expect(rendered).to match /event 1/
    expect(rendered).to match /event 2/
  end
end