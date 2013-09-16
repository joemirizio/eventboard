require 'test_helper'

class ChoicesControllerTest < ActionController::TestCase
  setup do
    @choice = choices(:choice_1)
		@poll = @choice.poll
  end

  test "should create choice" do
    assert_difference('Choice.count') do
      post :create, choice: { name: @choice.name }, poll_id: @poll.id
    end

    assert_redirected_to poll_path(@poll)
  end

  test "should destroy choice" do
    assert_difference('Choice.count', -1) do
      delete :destroy, id: @choice, poll_id: @poll.id
    end

    assert_redirected_to poll_path(@poll)
  end
end
