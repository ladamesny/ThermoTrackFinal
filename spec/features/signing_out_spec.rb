require "rails_helper"

RSpec.feature "A signed in user can sign out" do
	let!(:user) { FactoryGirl.create(:user)}

	before do 
		login_as(user)
	end

	scenario do
		visit "/"
		click_link "Signed in as #{user.name}"
		click_link "Logout"
		expect(page).to have_content("Signed out successfully.")
	end
end