require 'rails_helper'

RSpec.describe "Users", type: :request do

    let (:user) { create(:user) }
    let (:token) { log_in(user) }
    let (:user_params) do
        {
            firstname: "John",
            lastname: "Doe",
            phone_number: "1234567890",
            mailing_address: "123 Main St",
            email_address: "johndoe@gmail.com",
            password: "password"
        }
    end

    describe "POST /api/v1/users" do
        it "should create a new user" do
            post_request '/api/v1/users', token, {user: user_params}
        end
    end

    describe "PUT /api/v1/users/1" do
        it "should update a user" do
            post_request '/api/v1/users', token, {user: user_params}
            put_request "/api/v1/users/#{json_body["id"]}", token, {user: user_params}
        end
    end

    describe "DELETE /api/v1/users/1" do
        before do
            post_request '/api/v1/users', token, {user: user_params}
        end

        it "returns success on successful request" do
            delete_request "/api/v1/users/#{json_body["id"]}", token
            expect(response).to have_http_status(204)
        end
    end
end