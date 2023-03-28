class AdminAuthenticationController < AdminController
    before_action :authenticate_admin , except:[:create, :admin_login]

    def create
        @admin = Admin.new(admin_params)

        if @admin.save
        render json: @admin, status: :created
        else
        render json: { errors: @admin.errors.full_messages },
                status: :unprocessable_entity
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

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end


end