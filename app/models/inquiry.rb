class Inquiry < ActiveRecord::Base

  validates :name, :message, :presence => true
  validates :email,        :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   
  after_save :deliver_notification_email


  def deliver_notification_email
    InquiryMailer.notification(self).deliver
    # For delayed_job
    # InquiryMailer.send_later(:deliver_notification, self)
  end


end
