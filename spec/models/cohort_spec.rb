require 'spec_helper'

describe Cohort do
  it { should belong_to(:location) }
  it { should have_many(:users) }
end