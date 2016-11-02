FactoryGirl.define do
  factory :comic do
    comic_id            Faker::Number.number(5)
    title               Faker::Superhero.name
    number              Faker::Number.number(2)
    description         Faker::Lorem.sentence
    variant_description Faker::Lorem.sentence
    pages               Faker::Number.number(2)
    print_price         Faker::Number.decimal(2)
    digital_price       Faker::Number.decimal(2)
    on_sale             Faker::Date.between(2.weeks.ago, Date.today)
    modified_at         Faker::Date.between(2.weeks.ago, Date.today)

    trait :with_image do
      image
    end
  end
end
