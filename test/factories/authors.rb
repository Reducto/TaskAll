FactoryGirl.define do
  factory :author do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    date {Faker::Date.backward(14000)}
    after(:create) do |author|
      create_list(:post, 1+(Random.rand(9)), author_id: author.id)
    end
	end
end
