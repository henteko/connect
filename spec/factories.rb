FactoryGirl.define do
  factory :blog do
    user
    title     'title'
    raw_title 'title'
    body      'body'
    raw_body  'body'
  end

  factory :comment do
    user
    blog
    body      'body'
    raw_body  'body'
  end

  factory :link do
    title 'title'
    url   'url'
  end

  factory :notification do
    type 'Hipchat'
    active true
    room_name 'Dev'
    token 'token123456'
  end

  factory :page do
    user
    title     'title'
    raw_title 'title'
    body      'body'
    raw_body  'body'
    page_name 'home'
  end

  factory :user do
    email { Faker::Internet.email }
    password 'user1234'
    username { "user#{SecureRandom.hex 3}" }
  end
end
