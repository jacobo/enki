require 'bcrypt'

class Password
  # encrypt the given password
  # returns password_hash
  def self.encrypt_password(password)
    BCrypt::Password.create(password)
  end

  # compare a plain text password to the password_hash
  def self.verify_password_against_hash(plain_text_password, password_hash)
    # password object must be on left of == operator for this to work
    BCrypt::Password.new(password_hash.to_s) == plain_text_password.to_s
  end
end
