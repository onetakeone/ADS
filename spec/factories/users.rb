FactoryGirl.define do
  factory :user do
    username 'user'
    role 'user'
    email 'suer@suer'
    password 'useuseuse'
  end

  factory :admin do
    username 'admin'
    role 'admin'
    email 'adm@adm'
    password 'admadmadm'
  end

  factory :guest do
    username 'guest'
    role 'guest'
    email 'guest@guest'
    password 'gueguegue'
  end
end
