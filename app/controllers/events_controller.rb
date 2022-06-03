class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update]

  def index
    @events = current_user.events
    if params["date"]
      @date = params["date"].to_date
    else
      @date = Date.today
    end
  end

  def show
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
      ExtractEventInfos.new(@event).call
      redirect_to edit_event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :venue, :starts_at,
      :address, :latitude, :longitude, :category,
      :identity_card,:driver_card, :passport, :document
    )
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
