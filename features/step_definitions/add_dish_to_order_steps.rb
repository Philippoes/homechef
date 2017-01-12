And(/^I focus on dish "([^"]*)"$/) do |dish|
	dish = Dish.find_by(name: dish)
	@scope = "#dish_#{dish.id}"
end

And(/^I click the "([^"]*)" button$/) do |button|
	scope = @scope || 'body'
	within scope do
		click_link_or_button button
	end
end


And(/^I click "([^"]*)"$/) do |button|
	click_link_or_button button
end