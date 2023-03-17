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
      post_request "/api/v1/brands", token, {brand: brand_params}
      get "/api/v1/brands"
      expect(json_body.length).to be(1)
    end
  end
      
  describe "POST /api/v1/brands" do    
    it "should create a brand" do
      post_request "/api/v1/brands", token, {brand: brand_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /api/v1/brands/1" do
    before do 
      post_request "/api/v1/brands", token, {brand: brand_params}
    end
    
    it "returns success on successful request" do
      get "/api/v1/brands/#{json_body["id"]}"
      expect(response).to have_http_status(:success)
    end

    it "should show a brand" do
      get "/api/v1/brands/#{json_body["id"]}"
      expect(json_body["title"]).to eq(brand_params[:title])
    end    
  end

  describe "DELETE /api/v1/brands/1" do
    before do 
      post_request "/api/v1/brands", token, {brand: brand_params}
    end

    it "returns success on successful request" do
      delete_request "/api/v1/brands/#{json_body["id"]}", token
      expect(response).to have_http_status(204)
    end
  end
end
