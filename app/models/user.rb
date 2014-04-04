class User < ActiveRecord::Base
  belongs_to :cohort

  has_secure_password
  has_many :user_kbombs
  has_many :kbombs, through: :user_kbombs

  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
end
