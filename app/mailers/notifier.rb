class Notifier < ActionMailer::Base
  default :from => 'no-reply@example.com'
  
  def support_notification(sender)
    @sender = sender
    mail(
      :to => "juan@bandofcoders.com",
      :bcc => "juan@bandofcoders.com",
      :subject => sender.subject + " - " + sender.email + " - " + sender.phone,
      :body => sender.message
    )
  end
end
