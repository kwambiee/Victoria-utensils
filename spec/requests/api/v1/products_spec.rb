require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:admin)  { create(:admin) }
  let(:token) { admin_login(admin) }
  let(:category) { create(:category) }
  let(:brand) { create(:brand) }
  let(:product_params) do
    {
        title: "Steel Cup",
        price: 100.0,
        category_id: category.id,
        brand_id: brand.id
    }
  end

  describe "GET /api/v1/products" do
    it "returns success on successful request" do
      get "/api/v1/products"
      expect(response).to have_http_status(:success)
    end
    it "returns list of products" do
      post_request "/admin/products", token, {product: product_params}
      get "/api/v1/products"
      expect(json_body).to be_an_instance_of(Array)
    end
  end

  describe "GET /api/v1/products/1" do
    before do
      post_request "/admin/products", token, {product: product_params}
    end

    it "returns success on successful request" do
      get "/api/v1/products/#{json_body["id"]}"
      expect(response).to have_http_status(:success)
    end

    it "should show a product" do
      get "/api/v1/products/#{json_body["id"]}"
      expect(json_body["title"]).to eq(product_params[:title])
    end
  end

end
