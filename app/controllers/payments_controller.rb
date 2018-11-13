class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.price, # amount in cents
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      )

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
        UserMailer.order_confirmation(@user, @email).deliver_now
      end

    rescue Stripe::CardError => e
      # The card had been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  redirect_to payment_create_path
  end

end
