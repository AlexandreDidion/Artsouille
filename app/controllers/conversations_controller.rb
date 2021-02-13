class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating, except: [:index]

  def index
    @conversations = Conversation.where('author_id = ? OR receiver_id = ?', current_user, current_user).order("updated_at ASC")
  end

  def show
    @message = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def check_participating
    redirect_to conversations_path unless @conversation.author || @conversation.receiver == current_user
  end
end
