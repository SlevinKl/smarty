class SendEventNotificationJob < ApplicationJob
  queue_as :default

  def perform
    users = User.all
    users.each do |user|
      event = user.events.where(starts_at: (Time.current + 12.hours)..(Time.current + 24.hours)).order(:starts_at).first
      next unless event

      interval = (event.starts_at - Time.current) / 3600
      next if event.notifications.any?

      Notification.create(title: event.title,
                          content: "Vous avez 1 évènement dans #{interval.round(0)} heures",
                          event: event)
    end
  end
end
