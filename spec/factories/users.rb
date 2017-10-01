FactoryGirl.define do 
  factory :user do
    username "user"
    role "user"
    email 'suer@suer'
    password 'useuse'
  end

  factory :admin do
    username "admin"
    role "admin"
    email 'adm@adm'
    password 'admadm'
  end

  factory :guest do
    username "guest"
    role "guest"
    email 'guest@guest'
    password 'guegue'
  end
end