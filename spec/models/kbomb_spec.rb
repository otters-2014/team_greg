require 'spec_helper'

describe Kbomb do
  it { should have_many(:user_kbombs) }
  it { should have_many(:users).through(:user_kbombs) }
end