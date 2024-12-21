class EventsController < ApplicationController
    def index
      @events = Event.all
    end
  
    def show
      @event = Event.find(params[:id])
    end
  
    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to events_path, notice: 'Event was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @event = Event.find(params[:id])
    end
  
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to event_path(@event), notice: 'Event was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path, notice: 'Event was successfully deleted.'
    end
  
    private
  
    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end