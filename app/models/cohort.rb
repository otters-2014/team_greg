class Cohort < ActiveRecord::Base
  belongs_to :location
  has_many :users
end
