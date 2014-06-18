 class Athlete < ActiveRecord::Base
  belongs_to :club

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def age(date)
    ((date - self.dob)/365.23).to_i
  end

  def category(date)
    age = self.age(date)
    case
      when age > 35 #veterans
        rnd_age = (self.age(date)/5).to_i*5
        return 'V'+rnd_age.to_s
      when age >= 20 #seniors
        return 'Sen'
      else
        if date.end_of_year - 121 > date #if date is before 1st Sept
          age = self.age(date.beginning_of_year - 122) #returns age on last 1st Sept
        else
          age = self.age(date.end_of_year - 121) #returns age on 1st Sept
        end
        case age
          when 0..12
            'U13'            
          when 13,14
            'U15'
          when 15, 16
            'U17'
          else
            'U20'
        end
    end
  end
end
