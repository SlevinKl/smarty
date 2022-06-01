class EventsController < ApplicationController
  def index
<<<<<<< HEAD
    @events = current_user.events

=======
    @events = Event.all
>>>>>>> master
  end

  def show
    @event = Event.find(params[:id])
    @marker = {
      lat: @event.latitude,
      lng: @event.longitude
    }
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
<<<<<<< HEAD
                                  :latitude, :longitude, :category, :identity_card,
                                  :driver_card, :passport, :photo)
=======
      :latitude, :longitude, :category, :identity_card,
      :driver_card, :passport, :document)
>>>>>>> master
  end
end
