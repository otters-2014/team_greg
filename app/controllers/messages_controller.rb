class MessagesController < ApplicationController

  def index

  end

  def new

  end

  def show

  end

  def create
    # raise params
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.save
    @conversation.messages << @message
    redirect_to user_conversation_path(current_user, @conversation)

  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
