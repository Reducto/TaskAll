FactoryGirl.define do
  factory :comment do
   	user {Faker::Name.name}
    text {Faker::Lorem.paragraph}
  end

end
