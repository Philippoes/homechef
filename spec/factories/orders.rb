FactoryGirl.define do
  factory :order do
    user { User.create(email: "email@somerandom.com", password: "123456", password_confirmation: "123456") }
  end
end