import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const conversation_id = messagesContainer.dataset.conversationId

    consumer.subscriptions.create({ channel: "ConversationChannel", conversation_id: conversation_id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initConversationCable };
