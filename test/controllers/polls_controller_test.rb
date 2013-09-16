require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  setup do
    @poll = polls(:poll_1)
		@event = @poll.event
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post :create, poll: { question: @poll.question }, event_id: @event.id
    end

    assert_redirected_to event_path(@event)
  end

  test "should show poll" do
    get :show, id: @poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll
    assert_response :success
  end

  test "should update poll" do
    patch :update, id: @poll, poll: { question: @poll.question }
    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete :destroy, id: @poll, event_id: @event.id
    end

    assert_redirected_to event_path(@event)
  end
end
