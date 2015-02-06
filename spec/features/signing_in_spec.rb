require "rails_helper"

RSpec.feature "A user can sign in" do 
	let!(:user) { FactoryGirl.create(:user) }

	scenario "with valid credentials" do
		visit "/users/sign_in"
		fill_in "Email", with: user.email
		fill_in "Password", with: "hunter2#"
		click_button "Log in"
		expect(page).to have_content("Signed in successfully.")
		expect(page).to have_content("Signed in as #{user.name}")
	end
end