class Api::V1::WishlistsController < ApplicationController

    def index
        
    end

    def create
        wishlist = @current_user.add_wishlist(product)
        render json: wishlist, status: :ok
    end

    def destroy
        @current_user.unlike(product)
    end

    private
    def product
        Product.find(params[:id])
    end
end
