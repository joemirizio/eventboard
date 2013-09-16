require 'test_helper'
 
class ChoiceTest < ActiveSupport::TestCase

	test "has name" do
		choice = create_choice
		assert choice.name == "Test"
	end

	test "has no votes after initialization" do
		choice = create_choice
		assert choice.votes == 0
	end

	test "voting increases votes by one" do
		choice = create_choice
		assert_difference('choice.votes') do
			choice.vote()
		end
	end

	test "can save" do
		choice = Choice.new
		choice.name = "Choice Name"
		assert choice.save
	end

	test "should not save without name" do
		choice = Choice.new
		refute choice.save, "Saved the choice without a name"
	end

	private

	def create_choice
		choice = Choice.new
		choice.name = "Test"
		choice.save()
		choice
	end

end
