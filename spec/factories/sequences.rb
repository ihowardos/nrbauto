FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
  sequence(:description) { |n| Faker::Lorem.sentence(n) }
end
