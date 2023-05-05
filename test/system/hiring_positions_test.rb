require "application_system_test_case"

class HiringPositionsTest < ApplicationSystemTestCase
  setup do
    @hiring_position = hiring_positions(:one)
  end

  test "visiting the index" do
    visit hiring_positions_url
    assert_selector "h1", text: "Hiring positions"
  end

  test "should create hiring position" do
    visit hiring_positions_url
    click_on "New hiring position"

    fill_in "Job details", with: @hiring_position.job_details
    fill_in "Location", with: @hiring_position.location
    fill_in "Title", with: @hiring_position.title
    click_on "Create Hiring position"

    assert_text "Hiring position was successfully created"
    click_on "Back"
  end

  test "should update Hiring position" do
    visit hiring_position_url(@hiring_position)
    click_on "Edit this hiring position", match: :first

    fill_in "Job details", with: @hiring_position.job_details
    fill_in "Location", with: @hiring_position.location
    fill_in "Title", with: @hiring_position.title
    click_on "Update Hiring position"

    assert_text "Hiring position was successfully updated"
    click_on "Back"
  end

  test "should destroy Hiring position" do
    visit hiring_position_url(@hiring_position)
    click_on "Destroy this hiring position", match: :first

    assert_text "Hiring position was successfully destroyed"
  end
end
