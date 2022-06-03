class DashboardsController < ApplicationController
  def show
    @date = Date.today
    @events = Event.where("starts_at >= ? ", @date)
    @events.first
  end
end
