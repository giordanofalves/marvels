FactoryGirl.define do
  factory :character do
    character_id  Faker::Number.number(5)
    name          Faker::Superhero.name
    description   Faker::Lorem.sentence
    url           Faker::Internet.url
    modified_at   Faker::Date.between(2.weeks.ago, Date.today)

    trait :with_image do
      image
    end

    trait :with_comics do
      after(:stub) { |character| character.comics = 3.times.map { create(:comic, :with_image) } }
    end
  end
end
