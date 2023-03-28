
module ApiHelper
    def headers(token)
        {
            'Authorization' => "Bearer " + token,
            'Content-Type' => 'application/json',
            'Accept' => 'application/json'
        }
    end

    def get_request(url, token)
        get url, headers: headers(token)
    end

    def post_request(url, token, params)
        post url, params: params.to_json, headers: headers(token)
    end

    def put_request(url, token, params)
        put url, params: params.to_json, headers: headers(token)
    end

    def delete_request(url, token)
        delete url, headers: headers(token)
    end

    def register_request(url, params)
        post url, params: params.to_h
    end

    def log_in(user)
        post '/login', params: { email_address: user.email_address, password: user.password }
        @token = JSON.parse(response.body)['token']
    end

    def admin_login(admin)
        post '/admin/login', params: { email: admin.email, password: admin.password }
        @token = JSON.parse(response.body)['token']
    end

    def json_body
      JSON.parse(response.body)
    end
end