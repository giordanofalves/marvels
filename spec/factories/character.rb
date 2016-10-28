FactoryGirl.define do
  factory :character do
    character_id  Faker::Superhero.name
    name          Faker::Superhero.name
    description   Faker::Lorem.sentence
    url           Faker::Internet.url
    modified_at   Faker::Date.between(2.weeks.ago, Date.today)

    trait :with_image do
      image
    end
  end
end
