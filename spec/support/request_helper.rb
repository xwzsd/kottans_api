module RequestHelper
  module JsonHelpers

    def get_user(url, options = {})
      get(url, options.merge({ headers: auth_headers }))
    end

    def auth_headers
      {
        'Authorization' => "Bearer #{access_token}"
      }
    end

    def access_token
      @access_token ||= FactoryGirl.create(:access_token, resource_owner_id: user.id).token
    end
  end
end
