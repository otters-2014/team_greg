require 'spec_helper'

describe ConversationsController do





  describe "GET #show" do
    let(:conversation) { Conversation.new(id: 1) }

    it "renders a conversation page" do
      id = "101"
      conversation = double(:conversation)
      Conversation.should_receive(:find).with(id).and_return(conversation)

      get :show, :id => id
      expect(assigns(:conversation)).to eq conversation
    end
  end
end
