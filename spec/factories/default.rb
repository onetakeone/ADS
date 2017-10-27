# frozen_string_literal: true

FactoryGirl.define do
  factory :ad do
    title { Faker::Lorem.word }
    body  { Faker::Lorem.sentence }
    state 'draft'
    type
    user
  end

  factory :published, class: Ad do
    title { Faker::Book.unique.title }
    body  { Faker::Lorem.unique.sentence }
    state 'published'
    type
    user
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(6) }
    role 'user'
    factory :user_with_ads do
      transient do
        ads_count(3)
      end
      after(:create) do |user, var|
        create_list(:ad, var.ads_count, user: user, id: [1..3], title: Faker::Book.unique.title)
      end
    end
  end

  factory :admin, class: User do
    username { Faker::Name.name }
    role 'admin'
    email { Faker::Internet.email }
    password { Faker::Internet.password(6) }
  end

  factory :type do
    ad_type { Faker::Lorem.unique.word }
    factory :type_with_ads do
      transient do
        ads_count(3)
      end
      after(:create) do |type, var|
        create_list(:ad, var.ads_count, type: type)
      end
    end
  end

  factory :picture do
    img_src { Rack::Test::UploadedFile.new(Rails.root.join(Faker::Avatar.image), 'image/jpeg') }
  end
end

# factory :user do
#   username 'user'
#   role 'user'
#   email 'suer@suer.su'
#   password 'useuseuse'
# end

# factory :writer, class: User do
#   id '48'
#   username 'qwerty'
#   role 'user'
#   email 'qwe@qwe.su'
#   password 'qwerty'
# end

# factory :writer_one, class: User do
#   id '23'
#   username 'writer1'
#   role 'user'
#   email 'w1@qwe.su'
#   password 'qwerty'
# end

# factory :writer_two, class: User do
#   id '24'
#   username 'writer2'
#   role 'user'
#   email 'w2@qwe.su'
#   password 'qwerty'
# end

# factory :guest do
#   username 'guest'
#   role 'guest'
#   email 'guest@guest.su'
#   password 'gueguegue'
# end
