When(/^I click the "([^"]*)" button for "([^"]*)"$/) do |button, dish|
  scope = Dish.find_by(name: dish)

  within "#dish-#{scope.id}" do
    click_link_or_button button
  end
end


And(/^there are two dishes in my order$/) do
  %q{
    When I am on the "landing" page
    And I click the "Add dish" button for "taco"
    And I click the "Add dish" button for "meatballs"
    And there should be "2" items on the last order
  }
end