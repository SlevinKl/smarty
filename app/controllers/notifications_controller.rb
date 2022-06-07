class NotificationsController < ApplicationController
  def read
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
    redirect_to dashboard_path
  end

end
