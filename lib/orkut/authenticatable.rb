module Orkut
  module Authenticatable

    # Credentials hash
    #
    # @return [Hash]
    def credentials_v1
      {
        :consumer_key => consumer_key,
        :consumer_secret => consumer_secret,
        :token => oauth_token,
        :token_secret => oauth_token_secret
      }
    end

    def credentials
      {
        :refresh_token => refresh_token,
        :access_token => access_token,
        :expires_in => expires_in,
        :issued_at => issued_at
      }
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      credentials.values.all? and credentials_v1.values.all?
    end

  end
end
