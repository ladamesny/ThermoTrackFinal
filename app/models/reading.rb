class Reading < ActiveRecord::Base
  belongs_to :thermometer

  def self.get_readings
    Thermometer.all.each do |therm|
      if therm.readings_on
        reading = HTTParty.get('https://polar-dawn-2893.herokuapp.com/')
        Reading.create(fahrenheit: reading['degrees'], thermometer_id: therm.id )
        therm.update(curr_temp_fah: reading['degrees'].to_i)
        therm.evaluate_reading
      end
    end
  end

  def self.delete_all
    Reading.all.each do |reading|
      reading.delete
    end
  end
end