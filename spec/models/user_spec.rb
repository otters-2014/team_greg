require 'spec_helper'

describe User do
  it { should have_secure_password }
  it { should have_many(:messages).with_foreign_key(:sender_id) }
end
