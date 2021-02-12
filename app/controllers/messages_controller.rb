class MessagesController < ApplicationController
  def new
    @receiver = User.find(params[:receiver_id])
    @conversation = Conversation.where(author_id: current_user.id, receiver_id: @receiver.id)
                                .or(Conversation.where(author_id: @receiver.id, receiver_id: current_user.id))
    redirect_to conversation_path(@conversation[0]) unless @conversation.empty?
    @message = current_user.messages.build
  end

  def create
    receiver = User.find(params[:message][:receiver_id])
    if params[:message][:conversation_id]
      @conversation = Conversation.find(params[:message][:conversation_id])
      @message = current_user.messages.build(message_params)
      @message.conversation = @conversation
    else
      @conversation = Conversation.create(author_id: current_user.id, receiver_id: receiver.id)
      @message = current_user.messages.build(message_params)
      @message.conversation = @conversation
    end
    @message.save!
    flash[:success] = "Your message was sent!"
    redirect_to conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
