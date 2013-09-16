require 'test_helper'
 
class EventTest < ActiveSupport::TestCase

	test "has name" do
		event = Event.new
		event.name = "Test"
		assert event.name == "Test"
	end

	test "can save" do
		event = Event.new
		event.name = "Event Name"
		event.description = "Event description"
		assert event.save
	end

	test "should not save without name" do
		event = Event.new
		event.description = "Event description"
		refute event.save, "Saved the event without a name"
	end

	test "should not save without description" do
		event = Event.new
		event.name = "Event Name"
		refute event.save, "Saved the event without a description"
	end

end
