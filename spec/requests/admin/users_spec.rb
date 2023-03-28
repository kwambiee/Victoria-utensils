require 'rails_helper'

RSpec.describe "Users", type: :request do

    let (:admin) { create(:admin) }
    let (:token) { admin_login(admin) }

    describe "GET /admin/users" do
        it "should return all users" do
            get_request "/admin/users", token
            expect(response).to have_http_status(:ok)
        end
    end
end