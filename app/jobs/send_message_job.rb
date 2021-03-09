class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    html = "<p>#{message.user.username}: #{message.content}</p>"
    conversation_id = message.conversation
    ActionCable.server.broadcast("conversation_channel_#{conversation_id}", data: html)
  end
end
