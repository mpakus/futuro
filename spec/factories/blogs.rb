# frozen_string_literal: true

FactoryGirl.define do
  factory :blog do
    name        { Faker::Lorem.sentence(3) }
    uri         { Faker::Lorem.sentence(3).parameterize }
    description { Faker::Lorem.sentence(15) }
    image ''
    settings ''
    owner { create(:user) }
    variant :personal
  end
end
