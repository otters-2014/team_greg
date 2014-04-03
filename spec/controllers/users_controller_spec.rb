require 'spec_helper'

describe UsersController do
  describe "GET #show" do
    # let(:user) { User.new(id: 1, email: 'team@greg.com', password: 'password', password_confirmation: 'password') }

    it "renders a user page" do
      id = "101"
      user = double(:user)
      User.should_receive(:find).with(id).and_return(user)

      get :show, :id => id
      expect(assigns(:user)).to eq user
    end
  end
end
