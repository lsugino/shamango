require 'bcrypt'

class Member < ActiveRecord::Base
  has_many :posts
  def name
  	"#{self.first_name.split.join}#{self.last_name.split.join}"
  end

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end