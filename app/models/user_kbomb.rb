class UserKbomb < ActiveRecord::Base
  belongs_to :user
  belongs_to :kbomb
end
