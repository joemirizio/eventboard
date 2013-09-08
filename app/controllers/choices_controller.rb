class ChoicesController < ApplicationController

	def create
		@poll = Poll.find(params[:poll_id])
		@choice = @poll.choices.create(choice_params)

		redirect_to poll_path(@poll)
	end


	def destroy
		@poll = Poll.find(params[:poll_id])
		@choice = @poll.choices.find(params[:id])
		@choice.destroy

		redirect_to poll_path(@poll)
	end

private
	def choice_params
		params.require(:choice).permit(:name)
	end
		
end
