require 'spec_helper'

describe User do
  it { should have_secure_password }
  it { should have_many(:user_kbombs) }
  it { should have_many(:kbombs).through(:user_kbombs) }
  it { should have_many(:received_messages).class_name('Message') }
  it { should have_many(:sent_messages).class_name('Message') }
end
