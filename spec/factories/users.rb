FactoryGirl.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email(name) }
    password '100500'
  end
end
