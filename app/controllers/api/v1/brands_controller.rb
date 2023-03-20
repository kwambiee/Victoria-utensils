class Api::V1::BrandsController < ApplicationController
    before_action :authenticate_request, except: [:index]
    def index
        @brands = Brand.all
        render json: @brands, status: :ok
    end
end
