require "rails_helper"
require "spec_helper"

RSpec.feature "Creating Thermometers:" do 
	let(:user) { FactoryGirl.create(:user) }

	before do
		login_as(user)
		FactoryGirl.create(:house, name: "Brooklyn")
		visit "/"
		click_link ""
		click_link "Add New Thermometer"
	end

	scenario "with valid attribues" do
		fill_in "Name", with: "Kitchen"
		fill_in "max_temp", with: 55
		fill_in "min_temp", with: 45
		click_button "Add Thermometer"

		expect(page).to have_content("Kitchen's thermometer has been added!")
	end

	scenario "with missing fields" do
		click_button "Add"

		expect.(page).to have_content("Thermometer has not been added.")
		expect.(page).to have_content("Name can't be blank")
	end
end