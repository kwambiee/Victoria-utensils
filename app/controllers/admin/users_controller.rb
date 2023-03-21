class Api::V1::UsersController < ApplicationController
    before_action :authenticate_admin, except: :create

    def index
        @users = User.all
        render json: @users, status: :ok
    end



end