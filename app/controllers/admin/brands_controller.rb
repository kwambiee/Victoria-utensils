class Admin::BrandsController < ApplicationController
    before_action :authenticate_admin
    before_action :find_brand, only: [:update, :destroy]

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
