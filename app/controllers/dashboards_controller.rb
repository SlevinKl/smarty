class DashboardsController < ApplicationController
  def show
    @date = Date.today
    @events = current_user.events.where("starts_at >= ? ", @date).order(:starts_at)
    @events = @events.first(4)
    @event = @events.last
  end
end
