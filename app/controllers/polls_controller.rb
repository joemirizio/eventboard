class PollsController < ApplicationController

	def show
		@poll = Poll.find(params[:id])
	end

	def create
		@event = Event.find(params[:event_id])
		@poll = @event.polls.create(poll_params)

		redirect_to event_path(@event)
	end


	def destroy
		@event = Event.find(params[:event_id])
		@poll = @event.polls.find(params[:id])
		@poll.destroy

		redirect_to event_path(@event)
	end

private
	def poll_params
		params.require(:poll).permit(:question)
	end
		
end
