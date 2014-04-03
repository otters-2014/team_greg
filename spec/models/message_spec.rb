require 'spec_helper'

describe Message do
  it { should belong_to(:sender).class_name('User') }
  it { should belong_to(:recipient).class_name('User') }
  it { should belong_to(:parent).class_name('Message') }
  it { should have_many(:children).class_name('Message') }
end
