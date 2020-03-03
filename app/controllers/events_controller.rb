class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @event = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
      if @event.save
        redirect to event_path(@event)
      else
        render :new
      end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:name, :address, :description, :category, :starts_at, :ends_at, :capacity)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end