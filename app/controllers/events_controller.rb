class EventsController < ApplicationController

	def index
		@events = Event.all
		respond_to do |format|
			format.html
			format.json { render json: @events }
			format.xml { render xml: @events }
		end
	end

	def show
		@event = Event.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @event }
			format.xml { render xml: @event }
		end
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to events_path
	end

	def overview
		@event = Event.find(params[:id])
	end

		
private
	def event_params
		params.require(:event).permit(:name, :description)
	end

end
