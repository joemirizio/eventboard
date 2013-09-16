require 'test_helper'

class PollTest < ActiveSupport::TestCase

	test "has question" do
		poll = Poll.new
		poll.question = "Test"
		assert poll.question == "Test"
	end

	test "can save" do
		poll = Poll.new
		poll.question = "Poll Question"
		assert poll.save
	end

	test "should not save without question" do
		poll = Poll.new
		refute poll.save, "Saved the poll without a question"
	end

end
