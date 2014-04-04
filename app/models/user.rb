class User < ActiveRecord::Base
  belongs_to :cohort

  has_secure_password
  has_many :user_kbombs
  has_many :kbombs, through: :user_kbombs

  has_many :messages, foreign_key: "sender_id"
end
