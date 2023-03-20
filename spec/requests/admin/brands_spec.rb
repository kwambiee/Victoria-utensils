require 'rails_helper'

RSpec.describe "Brands", type: :request do
  
  let(:user)  { create(:user) }
  let(:token) { log_in(user) }
  let(:brand_params) do
    {
      name: Faker::Appliance.brand
    }
  end
      
  describe "POST /admin/brands" do    
    it "should create a brand" do
      post_request "/admin/brands", token, {brand: brand_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /admin/brands/1" do
    before do 
      post_request "/admin/brands", token, {brand: brand_params}
    end

    it "returns success on successful request" do
      delete_request "/admin/brands/#{json_body["id"]}", token
      expect(response).to have_http_status(204)
    end
  end
end
