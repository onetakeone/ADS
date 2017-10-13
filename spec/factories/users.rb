FactoryGirl.define do
  factory :user do
    username 'user'
    role 'user'
    email 'suer@suer'
    password 'useuseuse'
  end

  factory :admin, class: User do
    username 'admin'
    role 'admin'
    email 'adm@adm'
    password 'admadmadm'
  end

  factory :writer, class: User do
    id '48'
    username 'qwerty'
    role 'user'
    email 'qwe@qwe'
    password 'qwerty'
  end

  factory :writer_one, class: User do
    id '23'
    username 'writer1'
    role 'user'
    email 'w1@qwe'
    password 'qwerty'
  end

  factory :writer_two, class: User do
    id '24'
    username 'writer2'
    role 'user'
    email 'w2@qwe'
    password 'qwerty'
  end

  factory :guest do
    username 'guest'
    role 'guest'
    email 'guest@guest'
    password 'gueguegue'
  end
end
