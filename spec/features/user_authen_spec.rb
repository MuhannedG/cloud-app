require 'rails_helper'

# Test for the user authentication feature
RSpec.feature "User Authentication", type: :feature do
  scenario "User signs up and logs in" do
    visit new_user_registration_path

    # Fills in the registration form with user details
    fill_in "Email", with: "user11@example.com"
    fill_in "Password", with: "password11"
    fill_in "Password confirmation", with: "password11"

    # Submit the registration form
    click_button "Sign up"

  end
end
