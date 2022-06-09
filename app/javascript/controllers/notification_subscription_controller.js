import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static targets = ["notifications"]
  static values = { currentUserId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.currentUserIdValue },
      { received: data => this.notificationsTarget.insertAdjacentHTML("beforeend", data) }

    )
  }

  disconnect() {
    this.channel.unsubscribe()
  }
}
