class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @conversation}
      format.json { render json: @conversation.messages.sort_by(&:created_at).map(&:jsonify) }
    end
  end

  def create
    redirect_to user_conversation_path(current_user, get_conversation)
  end

  private

  def get_conversation
    user = User.find(params[:user_id])
    if conversation = (user.conversations & current_user.conversations).pop
      return conversation
    else
      create_new_conversation_with(user)
    end
  end

  def create_new_conversation_with(user)
    conversation = Conversation.new
    user.conversations << conversation
    current_user.conversations << conversation
    return conversation
  end
end
