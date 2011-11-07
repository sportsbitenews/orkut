require 'omniauth/oauth'
require 'google/api_client'
require 'orkut/error'

module Orkut
  module Connection

    @client = nil

    def authorization_uri(options={})
      client = Google::APIClient.new

      client.authorization.client_id     = client_id
      client.authorization.client_secret = client_secret
      client.authorization.scope         = scope
      client.authorization.redirect_uri  = redirect_uri

      orkut = client.discovered_api('orkut', 'v2')

      client.authorization.authorization_uri.to_s
    end

    def get_connection_hash
      return get_token_values(connection.authorization)
    end

    private

      def connection_v1(options={})
        access_token = nil
        if authenticated_v1?
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
        if @client.nil?
          @client = Google::APIClient.new

          @client.authorization.client_id     = client_id
          @client.authorization.client_secret = client_secret
          @client.authorization.scope         = scope
          @client.authorization.redirect_uri  = redirect_uri
          @client.authorization.code          = code

          if !options[:token_values].blank?
            @client.authorization.update_token!(options[:token_values])
            ::Orkut.configure do |config|
              config.refresh_token = options[:token_values][:refresh_token]
              config.access_token = options[:token_values][:access_token]
              config.expires_in = options[:token_values][:expires_in]
              config.issued_at = options[:token_values][:issued_at]
            end
          else
              if !refresh_token.blank? and !access_token.blank? and !expires_in.blank? and !issued_at.blank?
                @client.authorization.update_token!(credentials)
              end
          end

	  if refresh_token.blank? and access_token.blank? and expires_in.blank? and issued_at.blank?
             @client.authorization.fetch_access_token!
	  end

          update_token_values(@client.authorization)

          orkut = @client.discovered_api('orkut', 'v2')
          unless @client.authorization.access_token
            raise(Orkut::Error, 'Invalid access token')
          end
        end
        @client
      end

      def update_token_values(object)
        ::Orkut.configure do |config|
          config.refresh_token = object.refresh_token
          config.access_token = object.access_token
          config.expires_in = object.expires_in
          config.issued_at = Time.at(object.issued_at)
        end
      end

      def get_token_values(object)
        return {:refresh_token => object.refresh_token,
                :access_token  => object.access_token,
                :expires_in    => object.expires_in,
                :issued_at     => Time.at(object.issued_at)
        }
      end
  end
end
