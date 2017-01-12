When(/^I click the "([^"]*)" button for "([^"]*)"$/) do |button, dish|
	id = Dish.find_by(name: dish).id

	within(:css, "#dish_#{id}") do
		click_button button
	end

end

And(/^I focus on dish "([^"]*)"$/) do |dish|
	dish = Dish.find_by(name: dish)
	@scope = "#dish#{dish.id}"
end

And(/^I click the "([^"]*)" button for$/) do |button|
	scope = @scope || 'body'
	within scope do
		click_link_or_button button
	end
end

