class AdminController < ActionController::API

  include JsonWebToken
    before_action :authenticate_request

  private

  def authenticate_admin
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_admin = Admin.find(decoded[:admin_id])
    rescue
        render json: { error: 'unauthorized' }, status: :unauthorized
    end

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
