require 'rails_helper'

# Test for the user authentication feature
RSpec.feature "User Authentication", type: :feature do
  scenario "User signs up and logs in" do
    visit new_user_registration_path

    # Fills in the registration form with user details
    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password11"
    fill_in "Password confirmation", with: "password11"

    # Submit the registration form
    click_button "Sign up"

    # Verify that a success message is displayed
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
