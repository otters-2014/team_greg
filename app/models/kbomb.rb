class Kbomb < ActiveRecord::Base
  has_many :user_kbombs
  has_many :users, through: :user_kbombs
end
