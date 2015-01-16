module ApplicationHelper

  def display_datetime(reading)
    if user_signed_in? && !reading.thermometer.house.time_zone.blank?
      reading.created_at.in_time_zone(reading.thermometer.house.time_zone).strftime("%m/%d/%Y %l:%M%P %Z")
    end
  end

  # This method is used on the new thermometer form to populate the notification's list checkboxes
  def user_email_list
    @email_list = []

    EmailList.all.each do |email|
      if email.creator_id == current_user.id
        @email_list << email        
      end
    end
    @email_list
  end
end
