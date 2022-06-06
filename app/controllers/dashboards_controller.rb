class DashboardsController < ApplicationController
  def show
    @date = Date.today
    @events = Event.where("starts_at >= ? ", @date)
    @event = @events.last
  end
end
