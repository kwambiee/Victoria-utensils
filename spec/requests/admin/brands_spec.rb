require 'rails_helper'

RSpec.describe "Brands", type: :request do

 before :each do
  @admin = Admin.create!(email: "fkibagendi@gmail.com", password: "password")
  @token = admin_login(@admin)

  end

  let(:brand_params) do
    {
      name: "Cups"
    }
  end


  describe "POST /admin/brands" do
    it "should create a brand" do
      post_request "/admin/brands", @token, {brand: brand_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /admin/brands/1" do
    it "should update a brand" do
      post_request "/admin/brands", @token, {brand: brand_params}
      put_request "/admin/brands/#{json_body["id"]}", @token, {brand: brand_params}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /admin/brands/1" do
    before do
      post_request "/admin/brands", @token, {brand: brand_params}
    end

    it "returns success on successful request" do
      delete_request "/admin/brands/#{json_body["id"]}", @token
      expect(response).to have_http_status(204)
    end
  end
end
