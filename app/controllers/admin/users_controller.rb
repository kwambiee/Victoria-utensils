class Admin::UsersController < AdminController
    # before_action :authenticate_admin, except: :create

    def index
        @users = User.all
        render json: @users, status: :ok
        render html "hello"
    end



end