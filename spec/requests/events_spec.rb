require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    before do
      # Create some sample events to test the index page
      @event1 = Event.create(title: "Event 1", description: "First event", date: Time.now, location: "Location 1")
      @event2 = Event.create(title: "Event 2", description: "Second event", date: Time.now, location: "Location 2")
    end

    it "returns a successful response" do
      get events_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get events_path
      expect(response).to render_template(:index)
    end

    it "displays the correct events" do
      get events_path
      expect(response.body).to include(@event1.title)
      expect(response.body).to include(@event2.title)
    end
  end
end
