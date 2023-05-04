require "test_helper"

class HiringPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hiring_position = hiring_positions(:one)
  end

  test "should get index" do
    get hiring_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_hiring_position_url
    assert_response :success
  end

  test "should create hiring_position" do
    assert_difference("HiringPosition.count") do
      post hiring_positions_url, params: { hiring_position: { job_details: @hiring_position.job_details, location: @hiring_position.location, title: @hiring_position.title } }
    end

    assert_redirected_to hiring_position_url(HiringPosition.last)
  end

  test "should show hiring_position" do
    get hiring_position_url(@hiring_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_hiring_position_url(@hiring_position)
    assert_response :success
  end

  test "should update hiring_position" do
    patch hiring_position_url(@hiring_position), params: { hiring_position: { job_details: @hiring_position.job_details, location: @hiring_position.location, title: @hiring_position.title } }
    assert_redirected_to hiring_position_url(@hiring_position)
  end

  test "should destroy hiring_position" do
    assert_difference("HiringPosition.count", -1) do
      delete hiring_position_url(@hiring_position)
    end

    assert_redirected_to hiring_positions_url
  end
end
