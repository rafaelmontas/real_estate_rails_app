class User < ApplicationRecord
  has_many :likes
  has_many :properties, through: :likes
  include ImageUploader[:avatar]

  attr_accessor :remember_token, :reset_token
  before_save { self.email = email.downcase }

  validates :name, presence: { message: "no puede estar en blanco" }, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: { message: "no puede estar en blanco" }, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, message: "es invalido" },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: { message: "no puede estar en blanco" }, length: { minimum: 6, message: "es muy corta (mínimo 6 caracteres)" }, allow_nil: true
  has_secure_password

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

  # Remembers a user in the database for use in persistent sessions.
  def remember_user
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def user_authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget_user
    update_attribute(:remember_digest, nil)
  end

  # Sends welcome email.
  def send_welcome_email
    UserMailer.new_user_welcome(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest_user
    self.reset_token = User.new_token
    self.update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email_user
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # like method
  def likes?(property)
    property.likes.where(user_id: id).any?
  end

end
