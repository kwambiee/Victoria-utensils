require 'rails_helper'

RSpec.describe "Brands", type: :request do
  
  let(:user)  { create(:user) }
  let(:token) { log_in(user) }
  let(:brand_params) do
    {
      name: Faker::Appliance.brand
    }
  end

  describe "GET /api/v1/brands" do  
    it "returns success on successful request" do
      get "/api/v1/brands"
      expect(response).to have_http_status(:success)
    end
    it "returns list of brands" do
      post_request "/admin/brands", token, {brand: brand_params}
      get "/api/v1/brands"
      expect(json_body.length).to be(1)
    end
  end
end
