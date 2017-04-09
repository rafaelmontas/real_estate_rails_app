class Agent < ApplicationRecord
  include ImageUploader[:avatar]

  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def Agent.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Agent.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a agent in the database for use in persistent sessions.
  def remember
    self.remember_token = Agent.new_token
    update_attribute(:remember_digest, Agent.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets an agent.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private

    # Converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token = Agent.new_token
      self.activation_digest = Agent.digest(activation_token)
    end
end
