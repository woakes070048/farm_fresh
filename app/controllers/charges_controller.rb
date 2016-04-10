class ChargesController < ApplicationController
  def new
    @amount = (current_restaurant.basket_total * 1.2 * 100).to_i
    @display_amount = "£ #{@amount/100}"
  end

  def create
    @amount = (current_restaurant.basket_total * 1.2 * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    redirect_to restaurant_root_path, notice: "Payment successful, thanks for your order."
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
