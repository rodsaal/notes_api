require "rails_helper"

RSpec.describe "Api::V1::Notes", type: :request do
  describe "GET /api/v1/notes" do
    it "returns notes ordered by newest first" do
      create(:note, title: "Old", created_at: 2.days.ago)
      create(:note, title: "New", created_at: 1.day.ago)

      get "/api/v1/notes"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.first["title"]).to eq("New")
    end
  end

  describe "POST /api/v1/notes" do
    it "creates note with valid params" do
      post "/api/v1/notes", params: { note: { title: "Meeting", content: "Next steps" } }

      expect(response).to have_http_status(:created)
      expect(Note.count).to eq(1)
    end

    it "returns 422 and errors when invalid" do
      post "/api/v1/notes", params: { note: { title: "" } }

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["errors"]["title"].join).to include("can't be blank")

      expect(Note.count).to eq(0)
    end
  end
end
