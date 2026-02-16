FactoryBot.define do
  factory :note do
    title { Faker::Lorem.sentence(word_count: 3) }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
