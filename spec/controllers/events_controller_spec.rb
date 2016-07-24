require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:venue) {venue = build(:venue)}
  let(:category) {category = build(:category)}
  let(:event) { event = build(:event, starts_at: 2.days.from_now, name: "event 1", venue: venue, category: category) }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    before(:each) do
      event.save!
    end
    it "should assigns the requested event as @event" do
      #event.save!
      get :show, :id => event.to_param
      expect(assigns(:event)).to eq event
    end

    it "should render show template" do
      get :show, :id => event.to_param
      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end
end
