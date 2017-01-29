Given(/^that there is a user with email: "([^"]*)"$/) do |email|
  FactoryGirl.create(:user, email: email)
end