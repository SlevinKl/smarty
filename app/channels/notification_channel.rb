class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # user = User.find(params[:id])
    # stream_from "some_channel"

    # TODO: verifier que c'est le current user
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
