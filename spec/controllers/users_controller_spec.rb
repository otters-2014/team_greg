require 'spec_helper'

describe UsersController do
  describe 'GET #index' do
    it 'returns all users' do
      users = [double('user1'), double('user2')]
      User.should_receive(:all).and_return(users)
      get :index
      expect(assigns(:users)).to eq users
    end
  end

  describe "GET #show" do
    it "renders a user page" do
      id = "101"
      user = double(:user)
      User.should_receive(:find).with(id).and_return(user)

      get :show, :id => id
      expect(assigns(:user)).to eq user
    end
  end

  describe 'GET #new' do
    it 'calls new on User' do
      user = double('user')
      User.should_receive(:new).and_return(user)
      get :new
      expect(assigns(:user)).to eq user
    end
  end

  describe 'POST #create' do
    it 'instantiates creates user with valid params' do
      user = User.new(id: 1)
      user_params = {user: {'email' => 'tony@gmail.com', 'first_name' => 'Tony', 'last_name' => 'Ta', 'password' => 'password', 'password_confirmation' => 'password'}}
      User.should_receive(:new).with(user_params[:user]).and_return(user)
      User.any_instance.should_receive(:save).and_return(true)
      post :create, user_params
      expect(response).to redirect_to user_path(user)
    end

    it 'instantiates renders new template with invalid params' do
      user = User.new(id: 1)
      user_params = {user: {'first_name' => 'Tony', 'last_name' => 'Ta', 'password' => 'password', 'password_confirmation' => 'password'}}
      User.should_receive(:new).with(user_params[:user]).and_return(user)
      User.any_instance.should_receive(:save)
      post :create, user_params
      expect(response).to render_template('new')
    end
  end
end
