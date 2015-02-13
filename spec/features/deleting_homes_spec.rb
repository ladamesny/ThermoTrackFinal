require "rails_helper"
require "spec_helper"
Capybara.javascript_driver = :webkit

RSpec.feature "Deleting tickets" do 
	let(:user) {FactoryGirl.create(:user)}
	let!(:house) do
		FactoryGirl.create(:house, name: "summer", user: user )
	end

	before do
		login_as(user)
	end

	scenario "deleting house successfully" do
		visit '/houses'
		find(".deleteHouse_#{house.id}").click

		page.driver.browser.switch_to

		expect(page).to have_content("#{house.name} was deleted!")
	end
end