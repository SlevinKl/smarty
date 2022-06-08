class SendEventNotificationJob < ApplicationJob
  queue_as :default

  def perform
    users = User.all
    users.each do |user|
      event = user.events.where(starts_at: (Time.current + 12.hours)..(Time.current + 72.hours)).order(:starts_at).first
      next unless event

      interval = (event.starts_at - Time.current) / 3600
      next if event.notifications.any?

      notif = Notification.create(title: event.title,
                                  content: "Vous avez 1 évènement dans #{interval.round(0)} heures",
                                  event: event)
      # broadcast notif to current_user => render partial
      NotificationChannel.broadcast_to(user, ApplicationController.render(partial: "notifications/notification",
                                                                          locals: { notification: notif }))
    end
  end
end
