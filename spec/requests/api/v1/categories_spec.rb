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
      post_request "/admin/categories", token, {category: category_params}
      get "/api/v1/categories"
      expect(json_body).to be_an_instance_of(Array)
    end
  end
end
