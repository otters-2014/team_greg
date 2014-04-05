class User < ActiveRecord::Base
  has_secure_password

  belongs_to :cohort

  has_many :user_kbombs
  has_many :kbombs, through: :user_kbombs

  has_many :messages, foreign_key: "sender_id"
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
end
