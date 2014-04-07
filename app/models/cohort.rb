class Cohort < ActiveRecord::Base
  belongs_to :location
  has_many :users

  def self.to_a
  	Cohort.all.map { |cohort| [cohort.name,cohort.id]  }
  end

end
