FactoryGirl.define do
  factory :ad do
    title '1'
    body '1'
    state 'draft'
    type_id '1'
    user_id '1'
  end

  factory :wts, class: Ad do
    title 'wts'
    state 'published'
    body 'Test_Filter'
    type_id '1'
    user_id '48'
  end

  factory :wts_one, class: Ad do
    title 'wts'
    state 'published'
    body 'Test_Filter1'
    type_id '1'
    user_id '23'
  end

  factory :wts_two, class: Ad do
    title 'wts'
    state 'published'
    body 'Test_Filter2'
    type_id '1'
    user_id '24'
  end

  factory :type do
    id '1'
    ad_type 'type'
  end

  factory :picture do
    img_src { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'test.jpg'), 'image/jpeg') }
    ad_id '1'
  end
end
