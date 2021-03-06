class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update]
  before_action :user

  def index
    @events = current_user.events.order(:starts_at)

    if params[:category].present?
      @events = @events.where(category: params[:category])
    end

    if params["date"]
      @date = params["date"].to_date
    else
      @date = Date.today
    end

    @year = Date.today.year

    @events = @events.where(starts_at: @date.beginning_of_month..@date.end_of_month)

    # event.starts_at - Time.current > 0

    @next_event = @events.where(starts_at: (Time.current - 1.day)..).first
  end

  def show

   if @event.user != current_user
    flash[:alert] = "Vous ne pouvez pas acceder à cette page"
    redirect_to root_path
   end

    category_marker_class_mapping = {
      "Sport"   => "fa-volleyball sport-color",
      "Culture" => "fa-book culture-color",
      "Voyage"  => "fa-plane-departure voyage-color",
      "Autres"  => "fa-star-of-life autres-color"
    }

    @marker = {
      lat: @event.latitude,
      lng: @event.longitude,
      class_name: "fa-solid fa-2x #{category_marker_class_mapping[@event.category]}"
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

  def user
    @user = current_user
  end

end
