class User < ActiveRecord::Base
  validates :password_digest, :username, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :accounts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :wish_lists, through: :wishers


  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    user if user && user.is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!
    self.session_token
  end
end
