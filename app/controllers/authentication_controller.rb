class Authentication < ApplicationController
    before_action :authenticate_request, except: :login

    def login
        @user = User.find_by(email_address: params[:email_address])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), user: @user }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
end