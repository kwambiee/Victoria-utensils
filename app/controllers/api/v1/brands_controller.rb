class Api::V1::CategoriesController < ApplicationController
    before_action :authenticate_request, only: [:create, :update, :destroy]
    before_action :find_brand, only: [:show, :update, :destroy]

    def index
        @brands = Brand.all
        render json: @brands, status: :ok
    end

    def show
        render json: @brand, status: :ok
    end

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            render json: @brand, status: :created
        else
            render json: { errors: @brand.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def update
        if @brand.update(brand_params)
            render json: @brand, status: :ok
        else
            rrender json: { errors: @brand.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def destroy
        @brand.destroy
    end

    private

    def find_brand
        @brand = Brand.find(params[:id])
    end

    def brand_params
        params.require(:brand).permit(:name)
    end
end
