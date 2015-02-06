require "rails_helper"

RSpec.feature "Users can sign up" do 
	scenario "when providing valid details" do
		visit "/"
		click_link "Sign up"
		fill_in "Name", with: "Full Name"
		fill_in "Email", with: "sample@example.com"
		fill_in "user_password", with: "password#1"
		fill_in "Password confirmation", with: "password#1"
		click_button "Sign up"
		expect(page).to have_content("Welcome! You have signed up successfully.")
	end
end