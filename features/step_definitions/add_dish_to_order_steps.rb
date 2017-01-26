When(/^I click the "([^"]*)" button for "([^"]*)"$/) do |button, dish|
  scope = Dish.find_by(name: dish)
  within "#dish-#{scope.id}" do
    click_link_or_button button
  end
end

Then(/^I should see "([^"]*)" for "([^"]*)"$/) do |portions, dish_name|
  dish = Dish.find_by(name: dish_name)
  within("li#dish_#{dish.id}") do
    expect(page).to have_content portions
  end
end