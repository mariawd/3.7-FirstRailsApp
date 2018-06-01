class UserMailer < ApplicationMailer
  default from: 'mroar2003@yahoo.com.ar'

  def contact_form(email, name, message)
  @email = email
  @name = name
  @message = message
    mail(:from => email,
         :to => 'mroar2003@yahoo.com.ar',
         :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Berlin"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

  def payment_confirmation(user, product)
		@user = user
		@product = product
		@message = message
		mail(:to => user.email,
		     :subject => "Your Bike Berlin purchase confirmation",
		     :body => "Thank you for purchasing #{@product.name}")
	end

end
