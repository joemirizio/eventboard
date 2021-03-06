class PollsController < ApplicationController

	def show
		@poll = Poll.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @poll }
			format.xml { render xml: @poll }
		end
	end

	def create
		@event = Event.find(params[:event_id])
		@poll = @event.polls.create(poll_params)

		redirect_to event_path(@event)
	end

	def edit
		@poll = Poll.find(params[:id])
	end

	def update
		@poll = Poll.find(params[:id])

		if @poll.update(poll_params)
			redirect_to @poll
		else
			render 'edit'
		end
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
