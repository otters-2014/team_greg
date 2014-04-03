class User < ActiveRecord::Base
  belongs_to :cohort

  has_secure_password
end
