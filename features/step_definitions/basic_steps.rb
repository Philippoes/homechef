Then(/^show me the page$/) do
  save_and_open_page
end

And(/^that there is a user logged in with an email of "([^"]*)"$/) do |email|
    FactoryGirl.create(:user, email: email)
    user = User.find_by(email: email)
    login_as(user, scope: :user)
end