 class Athlete < ActiveRecord::Base
  include Importable

  belongs_to :club

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def age(date)
    ((date - self.dob)/365.23).to_i
  end

  def category(date)
    return "n/a" unless self.dob?
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

  def self.import(file)
    return false unless file && s = import_spreadsheet(file)
    # rows = s.parse(:name => 'Full name', :bib => 'Bib', :club => 'Club', clean: true)
    rows = s.parse(:id => 'ID', :name => 'Full name',:dob => 'Date of birth', :bib => 'Bib', :club => 'Club', clean: true)
    rows[1..s.last_row-1].each do |row|
      if row[:name]
        split_names = row[:name].partition(" ")
        first_name = split_names[0].titleize
        last_name = split_names[2].titleize
      else
        next
      end
      dob = row[:dob]
      bib = row[:bib]
      club = Club.find_by_abbr(row[:club])
      club_id = club ? club.id : nil
      athlete = find(row[:id]) if row[:id]
      athlete ||= where(first_name: first_name, dob: dob)
      athlete = athlete.size >= 1 ? athlete.select{ |a| a.last_name == last_name }.first : nil
      athlete ||= new
      athlete.update_attributes(first_name: first_name, last_name: last_name, dob: dob, bib: bib, club_id: club_id)
    end
  end
 
  def find_athlete(first_name, last_name, dob)
    
  end
end
