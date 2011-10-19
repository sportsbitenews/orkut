require 'omniauth/oauth'

module Orkut
  module Connection
  private

    def connection(options={})
      access_token = nil
      if authenticated?
        client_options = {
          :site => site,
          :request_token_path => request_token_path,
          :access_token_path => access_token_path,
          :authorize_path => authorize_path
        }
        consumer = ::OAuth::Consumer.new(consumer_key, consumer_secret, client_options)
        # now create the access token object from passed values
        token_hash = { :oauth_token => oauth_token,
          :oauth_token_secret => oauth_token_secret
        }
        access_token = ::OAuth::AccessToken.from_hash(consumer, token_hash)
      end
      access_token
    end
    
  end
end