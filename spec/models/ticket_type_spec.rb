require 'rails_helper'

RSpec.describe TicketType, type: :model do
  context "multiple tickets with different prices" do
    it "should handles one ticket type case" do

    end

    it "should handles duplicates" do
      event = Event.new name: "test event"
      event.save validate: false
      type1 = event.ticket_types.create! price: 1.00
      type2 = event.ticket_types.create price: 1.00
      expect(type2.errors).to eq ""
    end
  end
end
