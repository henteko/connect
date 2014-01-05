FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'admin123'
  end

  factory :wiki do
    title    'title'
    body     'body'
    raw_body 'body'
  end
end