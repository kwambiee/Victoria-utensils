class AdminController < ActionController::API

  include JsonWebToken
    before_action :authenticate_admin

  private

  def authenticate_admin
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_admin = Admin.find(decoded[:admin_id])
    rescue
        render json: { error: 'unauthorized' }, status: :unauthorized
    end
end
