class Thermometer < ActiveRecord::Base

  belongs_to :house
  validates_presence_of :name
  has_many :readings, dependent: :destroy
  has_many :thermometer_email_lists
  has_many :email_lists, through: :thermometer_email_lists, dependent: :destroy

  def evaluate_reading
    if self.curr_temp_fah && (self.curr_temp_fah > self.max_temp || self.curr_temp_fah < self.min_temp)
      self.email_lists.each do |user|
        NotificationMailer.notification_mail(user,self).deliver
      end
    end
  end

  def delete_readings
    self.readings.each do |reading|
      reading.delete
    end
  end
end