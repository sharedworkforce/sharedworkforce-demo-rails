class CatMailer < ActionMailer::Base
  default from: "\"Shared Workforce\" <erica@sharedworkforce.com>"

  def summary_email(cat)
    @cat = cat
    mail(:to => cat.notification_email, :subject => "Your cat has been processed by Shared Workforce.")
  end
end
