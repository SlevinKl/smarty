class DashboardsController < ApplicationController
  def show
    @date = Date.today
    @events = Event.where("starts_at >= ? ", @date).order(:starts_at)
    @events = @events.first(4)
    @event = @events.last
  end
end
