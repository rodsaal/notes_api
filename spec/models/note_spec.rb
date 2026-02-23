# spec/models/note_spec.rb
require "rails_helper"

RSpec.describe Note, type: :model do
  subject(:note) { build(:note) }

  describe "validations" do
    it "is valid with a title" do
      expect(note).to be_valid
    end

    context "when title is blank" do
      subject(:note) { build(:note, title: nil) }

      it "is invalid" do
        expect(note).not_to be_valid
      end

      it "adds an error message" do
        note.valid?
        expect(note.errors[:title]).to include("can't be blank")
      end
    end
  end

  describe ".recent" do
    it "orders notes by created_at desc" do
      older = create(:note, created_at: 2.days.ago)
      newer = create(:note, created_at: 1.day.ago)

      expect(described_class.recent).to eq([newer, older])
    end
  end
end