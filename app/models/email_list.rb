class EmailList < ActiveRecord::Base

  validates_presence_of :email
  validates_presence_of :name
    
  has_many :thermometer_email_lists
  has_many :thermometers, through: :thermometer_email_lists

end