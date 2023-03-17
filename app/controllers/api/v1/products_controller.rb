class Api::V1::ProductsController < ApplicationController
    before_action :authenticate_request, only: [:create, :update, :destroy]
    before_action :find_product, only: [:show, :update, :destroy]

    def index
        @products = Product.all
        render json: @products, status: :ok
    end

    def new_products
        @products = Product.new_products
        render json: @products, status: :ok
    end

    def show
        render json: @product, status: :ok
    end

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
