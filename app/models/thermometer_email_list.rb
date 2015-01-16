class ThermometerEmailList < ActiveRecord::Base
  
  belongs_to :thermometer
  belongs_to :email_list

end