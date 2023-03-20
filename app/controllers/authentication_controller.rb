class AuthenticationController < ApplicationController
    before_action :authenticate_request
    before_action :authenticate_admin

    def login
        @user = User.find_by(email_address: params[:email_address])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            render json: { token: token }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    def admin_login
        @admin = Admin.find_by(email: params[:email])
        if @admin&.authenticate(params[:password])
            token = jwt_encode(admin_id: @admin.id)
            render json: { token: token }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    private

    def login_params
        params.permit(:email_address, :password)
    end

    def admin_params
        params.permit(:email, :password)
    end

end