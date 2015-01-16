ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "google.com",
  :user_name            => "rajatsubhrachatterjee.rkmv.xav",
  :password             => "turntotech",
  :authentication       => "plain",
  :enable_starttls_auto => true
}