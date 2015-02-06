require "rails_helper"

RSpec.feature "Creating Houses" do 
	before do
		sign_in_as!(FactoryGirl.create(:user))
		visit "/houses"
		click_link "Add New House"
	end
	scenario "A user can create a new house" do

		fill_in "Name of house", with: "Summer home"
		click_button "Add house"

		expect(page).to have_content("Summer home")
	end
end