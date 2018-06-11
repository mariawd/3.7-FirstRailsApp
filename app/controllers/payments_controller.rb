class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    #byebug

    begin
      charge = Stripe::Charge.create(
        amount:  (@product.price.to_f * 100).to_i, # amount in cents, again
        currency: "EUR",
        source: token,
        description: params[:stripeEmail],
      )

      if charge.paid
        Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price.to_i)
        flash[:notice] = "Your payment was processed successfully"
        UserMailer.payment_confirmation(@user, @product).deliver_now
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product), notice: "Thank you for ordering"
  end

end
