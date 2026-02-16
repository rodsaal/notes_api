require "rails_helper"

RSpec.describe Note, type: :model do
  it "is valid with title" do
    expect(build(:note)).to be_valid
  end

  it "is invalid without title" do
    note = build(:note, title: nil)
    expect(note).not_to be_valid
    expect(note.errors[:title]).to include("can't be blank")
  end
end
