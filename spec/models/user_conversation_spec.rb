require 'spec_helper'

describe UserConversation do
 it { should belong_to(:user) }
 it { should belong_to(:conversation) }
end
