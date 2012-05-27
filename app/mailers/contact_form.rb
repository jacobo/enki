class ContactForm < ActionMailer::Base

  def contact(params)
    creds = MailCred.first || (raise "no creds!")
    ActionMailer::Base.smtp_settings[:user_name] = creds.user_name
    ActionMailer::Base.smtp_settings[:password] = creds.password
    @params = params[:contact].to_hash
    mail :from => creds.user_name, :to => "jburkhart@jbirdcreations.com"
  end

end
