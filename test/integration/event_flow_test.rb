require 'test_helper'

class EventFlowTest < ActionDispatch::IntegrationTest
	fixtures :events

	test "create event with polls and choices" do
		go_to_event_create
		event = create_event
		poll = create_poll(event.id)
		choice = create_choice(poll.id)
	end


	private

	def go_to_event_create
		get new_event_path
		assert_response :success
	end

	def create_event
		post_via_redirect events_path, event: { name: 'Test', description: 'Test' }
		assert_response :success
		assert assigns(:event), 'Did not assign event'
		assert_equal event_path(assigns(:event).id), path
		assigns(:event)
	end

	def create_poll(event_id)
		post event_polls_path(event_id), poll: { question: 'Test' }
		poll = assigns(:poll)
		assert poll, 'Did not assign poll'
		follow_redirect!
		assert_response :success
		assert_equal event_path(assigns(:event)), path
		poll
	end

	def create_choice(poll_id)
		post poll_choices_path(poll_id), choice: { name: 'Test' }
		choice = assigns(:choice)
		assert choice, 'Did not assign choice'
		follow_redirect!
		assert_response :success
		assert_equal poll_path(choice.poll.id), path
		choice
	end

end
