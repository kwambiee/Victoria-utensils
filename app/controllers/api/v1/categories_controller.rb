class Api::V1::CategoriesController < ApplicationController
    before_action :authenticate_request, except: [:index]
    def index
        @categories = Category.all
        render json: @categories, status: :ok
    end
end
