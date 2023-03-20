class Admin::ProductsController < ApplicationController
    before_action :authenticate_request
    before_action :find_product, only: [:update, :destroy]

    def create
        @product = Product.new(product_params)
        
        if @product.save
            render json: @product, status: :created
        else
            render json: { errors: @product.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
            render json: @product, status: :ok
        else
            render json: { errors: @product.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def destroy
        @product.destroy
    end

    private

    def find_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:title, :image_url, :description, :color, :price, :quantity,:category_id,:brand_id)
    end
end
