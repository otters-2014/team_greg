class User < ActiveRecord::Base
  has_secure_password
  has_many :user_kbombs
  has_many :kbombs, through: :user_kbombs
end
