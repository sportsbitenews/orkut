require 'omniauth/oauth'
require 'google/api_client'

module Orkut
  module Connection
  private

    def connection_v1(options={})
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

    def connection(options={})
      access_token = nil
      if authenticated?
        client = Google::APIClient.new

        client.authorization.client_id     = client_id
        client.authorization.client_secret = client_secret
        client.authorization.scope         = scope
        client.authorization.redirect_uri  = redirect_uri

        client.authorization.code          = code

        orkut = client.discovered_api('orkut', 'v2')
        unless client.authorization.access_token
          r = Rack::Response.new
          r.redirect(client.authorization.authorization_uri.to_s)
          r.finish
        end
      end
      access_token
    end

    def authorization_uri(options={})
      client = Google::APIClient.new

      client.authorization.client_id     = client_id
      client.authorization.client_secret = client_secret
      client.authorization.scope         = scope
      client.authorization.redirect_uri  = redirect_uri

      orkut = client.discovered_api('orkut', 'v2')

      client.authorization.authorization_uri.to_s
    end
    
  end
end