FactoryGirl.define do
  factory :post do
    title   { Faker::Lorem.sentence(5) }
    content { Faker::Lorem.sentence(50) }
    access :for_everyone
    blog
    owner { create(:user) }
  end

end
