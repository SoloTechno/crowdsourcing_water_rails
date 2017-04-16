# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  remember_digest :string
#  first_name      :string
#  last_name       :string
#  account_type    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  has_many :water_purity_reports
  has_many :water_source_reports

	enum account_type: {
    user: 0,
    worker: 1,
    manager: 2,
    admin: 3
  }

	validates :first_name,  presence: true, length: { minimum: 1, maximum: 100 }, on: :update
	validates :last_name,  presence: true, length: { minimum: 1, maximum: 100 }, on: :update

	validates :email, presence: true, length: { maximum: 300 },
	                  format: { with: /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i },
	                  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	validates_confirmation_of :password

	before_save :default_account_type
	def default_account_type
		self.account_type ||= User.account_types[:user]
	end

	# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Resets password
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
end
