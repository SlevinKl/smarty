class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all.order(:created_at)
    @notifications.each do |notif|
      notif.read = true
      notif.save
    end
  end


  def read
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
    redirect_to dashboard_path
  end

end
