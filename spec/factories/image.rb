FactoryGirl.define do
  factory :image do
    full_url      Faker::Avatar.image
    standard_url  Faker::Avatar.image
    portrait_url  Faker::Avatar.image
    landscape_url Faker::Avatar.image
  end
end
