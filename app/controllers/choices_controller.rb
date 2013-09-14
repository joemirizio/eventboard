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

	def vote
		@choice = Choice.find(params[:id])
		@choice.votes += 1
		@choice.save()

		respond_to do |format|
			format.html {
				@poll_index = params[:choice][:poll_index]

				@event = @choice.poll.event
				render 'events/overview'
			}
			format.js {
				render json: @choice, content_type: 'application/json'
			}
		end
	end

private
	def choice_params
		params.require(:choice).permit(:name)
	end
		
end
