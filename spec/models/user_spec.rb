require 'spec_helper'

describe User do
  let(:user) {User.new(first_name: 'Tony',
                       last_name: 'Ta',
                       email: 'tony@gmail.com',
                       password: 'password',
                       password_confirmation: 'password')}

  it { should have_secure_password }

  it do
    user.save
    should validate_uniqueness_of(:email)
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should belong_to(:cohort) }

  it { should have_many(:user_kbombs) }
  it { should have_many(:kbombs).through(:user_kbombs) }

  it { should have_many(:messages).with_foreign_key(:sender_id) }
  it { should have_many(:user_conversations) }
  it { should have_many(:conversations).through(:user_conversations) }

  describe '#full_name' do
    it 'should return a user\'s full name' do
      expect(user.full_name).to eq 'Tony Ta'
    end
  end
end
