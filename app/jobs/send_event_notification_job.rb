class SendEventNotificationJob < ApplicationJob
  queue_as :default

  def perform
    @user = current_user
    @event = current_user.events.where("starts_at >= ? ", @date).order(:starts_at).first

  end
end
