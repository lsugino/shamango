class Post < ActiveRecord::Base
  belongs_to :member
  has_many :comments
  def month(month_int)
  	month = ""
      case month_int
        when 1
        month = "January"
        when 2
        month = "February"
        when 3
        month = "March"
        when 4
        month = "April"
        when 5
        month = "May"
        when 6
        month = "June"
        when 7
        month = "July"
        when 8
        month = "August"
        when 9
        month = "September"
        when 10
        month = "October"
        when 11
        month = "November"
        when 12
        month = "December"
      end
    month
  end
end