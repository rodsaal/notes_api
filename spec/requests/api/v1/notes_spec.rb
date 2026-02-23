# frozen_string_literal: true
require "swagger_helper"

RSpec.describe "Api::V1::Notes", type: :request do
  path "/api/v1/notes" do
    get "Lists notes ordered by newest first" do
      tags "Notes"
      produces "application/json"

      response "200", "notes listed" do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   content: { type: :string, nullable: true },
                   created_at: { type: :string, format: "date-time" },
                   updated_at: { type: :string, format: "date-time" }
                 },
                 required: %w[id title created_at updated_at]
               }

        before do
          create(:note, title: "Old", created_at: 2.days.ago)
          create(:note, title: "New", created_at: 1.day.ago)
        end

        run_test! do |response|
          json = JSON.parse(response.body)
          expect(json.first["title"]).to eq("New")
        end
      end
    end

    post "Creates a note" do
      tags "Notes"
      consumes "application/json"
      produces "application/json"

      parameter name: :note, in: :body, required: true, schema: {
        type: :object,
        properties: {
          note: {
            type: :object,
            properties: {
              title: { type: :string },
              content: { type: :string, nullable: true }
            },
            required: ["title"]
          }
        },
        required: ["note"]
      }

      response "201", "note created" do
        let(:note) { { note: { title: "Meeting", content: "Next steps" } } }

        run_test! do
          expect(Note.count).to eq(1)
        end
      end

      response "422", "validation errors" do
        let(:note) { { note: { title: "" } } }

        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   additionalProperties: {
                     type: :array,
                     items: { type: :string }
                   }
                 }
               },
               required: ["errors"]

        run_test! do |response|
          json = JSON.parse(response.body)
          expect(json["errors"]["title"].join).to include("can't be blank")
          expect(Note.count).to eq(0)
        end
      end
    end
  end
end