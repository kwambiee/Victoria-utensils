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
      
  describe "POST /admin/categories" do    
    it "should create a category" do
      post_request "/admin/categories", token, {category: category_params}
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /admin/categories/1" do
    before do 
      post_request "/admin/categories", token, {category: category_params}
    end

    it "returns success on successful request" do
      delete_request "/admin/categories/#{json_body["id"]}", token
      expect(response).to have_http_status(204)
    end
  end
end
