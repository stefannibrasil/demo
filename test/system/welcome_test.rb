require "application_system_test_case"

class WelcomeTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_path

    assert page.has_text? 'Hello World'
  end
end