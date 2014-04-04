require 'spec_helper'

describe Message do
  it { should belong_to(:sender).class_name("User") }
end
