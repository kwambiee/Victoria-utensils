require 'rails_helper'

RSpec.describe "Products", type: :request do
  
  let(:user)  { create(:user) }
  let(:token) { log_in(user) }
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
      
  describe "POST /admin/products" do    
    it "should create product" do
      post_request "/admin/products", token, {product: product_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /admin/products/1" do
    before do 
      post_request "/admin/products", token, {product: product_params}
    end

    it "returns success on successful request" do
      delete_request "/admin/products/#{json_body["id"]}", token
      expect(response).to have_http_status(204)
    end
  end
end
