require "rails_helper"

RSpec.feature "Creating Houses" do
	let!(:user) { FactoryGirl.create(:user)}

	before do
		login_as(user)
	end
	
	scenario "A user can create a new House" do
		within('nav') {click_link "Add New House"}
		fill_in "Name of house", with: "Summer home"

		expect(page).to have_content("Summer home")
	end
end