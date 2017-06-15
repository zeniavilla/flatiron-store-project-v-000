class CartsController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    def show
        @current_cart = current_user.current_cart || Cart.find(params[:id])
    end

    def checkout
        checkout_cart = Cart.find(current_user.current_cart.id)

        checkout_cart.line_items.each do |line_item| 
            line_item.item.update_inventory(line_item.quantity)
        end

        checkout_cart.submitted_cart_status

        current_user.reset_current_cart
        
        redirect_to cart_path(checkout_cart)
    end

end
