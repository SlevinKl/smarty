class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @user = current_user

    @event = Event.new(event_params)
    @event.user = @user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :venue, :starts_at, :address,
      :latitude, :longitude, :category, :identity_card,
      :driver_card, :passport, :document)
  end
end
