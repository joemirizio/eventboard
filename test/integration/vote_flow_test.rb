require 'test_helper'

class VoteFlowTest < ActionDispatch::IntegrationTest
	fixtures :events, :polls, :choices

	test "can vote in a poll" do
		event = events(:event_1)
		go_to_event_overview(event)
		choice = choices(:choice_1)
		vote_in_poll(choice)
	end


	private
	
	def go_to_event_overview(event)
		get events_path
		assert_response :success

		get overview_event_path(event.id)
		assert_response :success
	end

	def vote_in_poll(choice)
		post_via_redirect vote_choice_path(choice.id)
		assert_response :success
		assert assigns(:event)
	end

end
