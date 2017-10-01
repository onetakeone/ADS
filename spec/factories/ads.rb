FactoryGirl.define do 
  factory :ad do
    title '1'
    body '1'
    state 'draft'
    type_id '1'
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