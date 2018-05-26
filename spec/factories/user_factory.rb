FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user do
    email 
    password "1234567890"
    first_name "Peter"
    last_name "Sample"
    admin false
  end

  factory :admin, class: User do
    email
    password "test123"
    admin true
    first_name "Jens"
    last_name "Müller"
  end

end
