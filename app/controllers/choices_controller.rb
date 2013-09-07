class ChoicesController < ApplicationController

	def create
		@poll = Poll.find(params[:poll_id])
		@choice = @poll.choices.create(choice_params)

		redirect_to event_path(@poll.event)
	end


	def destroy
		@poll = Poll.find(params[:poll_id])
		@choice = @poll.choices.find(params[:id])
		@choice.destroy

		redirect_to event_path(@poll.event)
	end

private
	def choice_params
		params.require(:choice).permit(:name)
	end
		
end
