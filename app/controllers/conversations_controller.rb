class ConversationsController < ActionController::Base
  def show
    @conversation = Conversation.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @conversation}
      format.json { render json: @conversation.messages.sort_by(&:created_at).map(&:jsonify) }
    end
  end

end
