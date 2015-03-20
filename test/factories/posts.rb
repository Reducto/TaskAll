FactoryGirl.define do
  factory :post do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.paragraph}
    tags {Tag.all.sample(3)}
    after(:create) do |post|
      create_list(:comment, Random.rand(10), post_id: post.id)
    end
  end
end
