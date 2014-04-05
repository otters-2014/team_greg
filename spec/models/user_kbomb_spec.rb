require 'spec_helper'

describe UserKbomb do
 it { should belong_to(:user) }
 it { should belong_to(:kbomb) }
end
