require 'rails_helper'

RSpec.describe "Categories", type: :request do
  
  let(:user)  { create(:user) }
  let(:token) { log_in(user) }
  let(:category_params) do
    {
      title: "Cups",
      description: Faker::Lorem.paragraph(sentence_count: 2)
    }
  end

  describe "GET /api/v1/categories" do  
    it "returns success on successful request" do
      get "/api/v1/categories"
      expect(response).to have_http_status(:success)
    end
    it "returns list of categories" do
      post_request "/api/v1/categories", token, {category: category_params}
      get "/api/v1/categories"
      expect(json_body.length).to be(1)
    end
  end
      
  describe "POST /api/v1/categories" do    
    it "should create a category" do
      post_request "/api/v1/categories", token, {category: category_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /api/v1/categories/1" do
    before do 
      post_request "/api/v1/categories", token, {category: category_params}
    end
    
    it "returns success on successful request" do
      get "/api/v1/categories/#{json_body["id"]}"
      expect(response).to have_http_status(:success)
    end

    it "should show a category" do
      get "/api/v1/categories/#{json_body["id"]}"
      expect(json_body["title"]).to eq(category_params[:title])
    end    
  end

  describe "DELETE /api/v1/categories/1" do
    before do 
      post_request "/api/v1/categories", token, {category: category_params}
    end

    it "returns success on successful request" do
      delete_request "/api/v1/categories/#{json_body["id"]}", token
      expect(response).to have_http_status(204)
    end
  end
end
