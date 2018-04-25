class SimplePagesController < ApplicationController
  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3)
  end
end

class SimplePagesController < ApplicationController

  def index

  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
      :to => 'mroar2003@yahoo.com.ar',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end

end
