class DashboardsController < ApplicationController
  def show
    @date = DateTime.now
    @events = current_user.events.where("starts_at >= ? ", @date).order(:starts_at)
    @events = @events.first(4)
    @event = @events.first
    @notification = current_user.notifications.where(read: false).first
  end
end
