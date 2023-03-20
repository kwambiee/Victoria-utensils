class Api::V1::WishlistsController < ApplicationController
    before_action :find_wishlist, only: [:show, :update, :destroy]

    def index
        @products = Wishlist.wishlist_products(@current_user.id)
        render json: @products, status: :ok      
    end

    def create
        @wishlist = Wishlist.new(user: @current_user, product: product)
        if @wishlist.save
            render json: @wishlist, status: :created
        else
            render json: { errors: @wishlist.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def destroy
        @wishlist.destroy
    end

    private
    def product
        Product.find(wishlist_params[:product_id])
    end

    def find_wishlist
        @wishlist = Wishlist.find(params[:id])
    end

    def wishlist_params
        params.require(:wishlist).permit(:product_id)
    end
end
