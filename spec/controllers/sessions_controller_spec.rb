require 'spec_helper'

describe SessionsController do
  describe "POST #create" do
    let(:user) { User.new(id: 1, email: 'team@greg.com', password: 'password', password_confirmation: 'password') }

    it 'does not login if invalid email' do
      User.should_receive(:find_by_email).with('not_team@greg.com').and_return(nil)

      post(:create, login: {email: 'not_team@greg.com', password: 'password'})
      expect(session[:user_id]).to be_nil
      expect(response).to render_template :new
    end

    it 'does not login if password invalid' do
      User.should_receive(:find_by_email).with('team@greg.com').and_return(user)

      post(:create, login: {email: 'team@greg.com', password: 'wrong password'})
      expect(session[:user_id]).to be_nil
      expect(response).to render_template :new
    end

    it 'logs in a valid user' do
      User.should_receive(:find_by_email).with('team@greg.com').and_return(user)

      post(:create, login: {email: 'team@greg.com', password: 'password'})
      expect(session[:user_id]).to eq user.id
      expect(response).to redirect_to user_path(user)
    end
  end

  describe "POST #destroy" do
    it "sets the session to nil" do
      session[:user_id] = 1
      post(:destroy)
      expect(session[:user_id]).to be_nil
    end
    it "redirects to root" do
      post(:destroy)
      expect(response).to redirect_to root_path
    end
  end
end
