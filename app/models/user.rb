require 'digest/md5'

class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :cohort

  has_many :user_kbombs
  has_many :kbombs, through: :user_kbombs

  has_many :messages, foreign_key: "sender_id"
  has_many :user_conversations
  has_many :conversations, through: :user_conversations

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def email_hash
    Digest::MD5.hexdigest(self.email.strip.downcase)
  end
end
