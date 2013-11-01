class Member < ActiveRecord::Base
  has_many :posts
  def name
  	"#{self.first_name.split.join}#{self.last_name}"
  end

end