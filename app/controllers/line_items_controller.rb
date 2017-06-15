class LineItemsController < ApplicationController
    def create
        item_id = params[:item_id]
        
        if !current_user.current_cart || current_user.current_cart.status == "submitted"
            current_cart_id = current_user.set_current_cart
        end
        line_item = current_user.current_cart.add_item(item_id)
        
        current_user.current_cart.line_items << line_item

        redirect_to cart_path(current_user.current_cart)
    end
end
