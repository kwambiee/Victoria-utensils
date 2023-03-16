class Api::V1::CategoriesController < ApplicationController
    before_action :authenticate_request, only: [:create, :update, :destroy]
    before_action :find_category, only: [:show, :update, :destroy]

    def index
        @categories = Category.all
        render json: @categories, status: :ok
    end

    def show
        render json: @category, status: :ok
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: @category, status: :created
        else
            render json: { errors: @category.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def update
        if @category.update(category_params)
            render json: @category, status: :ok
        else
            rrender json: { errors: @category.errors.full_messages },
             status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
    end

    private

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:title, :description)
    end
end
