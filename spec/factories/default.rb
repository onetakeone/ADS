# frozen_string_literal: true

#
FactoryGirl.define do
  # Advert factories
  #
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
    created_at { Faker::Time.between(DateTime.now - 9, DateTime.now) }
    state 'published'
    type
    user
  end

  # User facories
  #
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
        create_list(:ad, var.ads_count, user: user, id: [1..3], 
                    title: Faker::Book.unique.title)
      end
    end
  end

  factory :admin, class: User do
    username { Faker::Name.name }
    role 'admin'
    email { Faker::Internet.email }
    password { Faker::Internet.password(6) }
  end

  # Secondary factories
  #
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
    img_src { Rack::Test::UploadedFile.new(Rails.root.join(Faker::Avatar.image), 
              'image/jpeg') }
  end
end
