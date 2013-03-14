class User < ActiveRecord::Base
  has_many :urls
  def self.authenticate(email, password)
    user = User.find_by_email(email)
    user && (BCrypt::Password.new(user.password_hash) == password)
  end
end
