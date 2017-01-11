When(/^I click the "([^"]*)" button for "([^"]*)"$/) do |button, dish|
	id = Dish.find_by(name: dish).id

	within(:css, "#dish_#{id}") do
		click_button button
	end

end