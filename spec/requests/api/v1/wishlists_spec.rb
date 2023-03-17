require 'rails_helper'

RSpec.describe "Wishlists", type: :request do
  let(:user)  { create(:user) }
  let(:token) { log_in(user) }
  let(:category) { create(:category) }
  let(:brand) { create(:brand) }
  let(:product) { create :product, title: "Cooking pan", price: 600.0, category: category, brand: brand }
  let(:wishlist_params) do
    {
      product_id: product.id,
      user_id: user.id
    }
  end

  describe "POST /api/v1/wishlists" do    
    it "should create a wishlisting" do
      post_request "/api/v1/wishlists", token, {wishlist: wishlist_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /api/v1/wishlists/1" do
    before do 
      post_request "/api/v1/wishlists", token, {wishlist: wishlist_params}
    end

    it "returns success on successful request" do
      delete_request "/api/v1/wishlists/#{json_body["id"]}", token
      expect(response).to have_http_status(204)
    end
  end
end
