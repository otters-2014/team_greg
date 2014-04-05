require 'spec_helper'

describe Conversation do
  it { should have_many(:user_conversations) }
  it { should have_many(:users).through(:user_conversations) }
  it { should have_many(:messages) }
end
