require 'orkut/version'

module Orkut
  # Defines constants and methods related to configuration
  module Config
    # An array of valid keys in the options hash when configuring a {Orkut::API}
    VALID_OPTIONS_KEYS = [
      :site,
      :request_token_path,
      :access_token_path,
      :authorize_path,
      :endpoint,
      :endpoint_rest,
      :endpoint_rpc,
      :user_agent,
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret,
      :client_id,
      :client_secret,
      :scope,
      :redirect_uri,
      :refresh_token,
      :access_token,
      :expires_in,
      :issued_at,
      :code].freeze

    DEFAULT_SITE = 'https://www.google.com'.freeze
    
    DEFAULT_REQUEST_TOKEN_PATH = '/accounts/OAuthGetRequestToken'.freeze
    
    DEFAULT_ACCESS_TOKEN_PATH = '/accounts/OAuthGetAccessToken'.freeze
    
    DEFAULT_AUTHORIZE_PATH = '/accounts/OAuthAuthorizeToken'.freeze

    # By default, don't set an application key
    DEFAULT_CONSUMER_KEY = nil

    # By default, don't set an application secret
    DEFAULT_CONSUMER_SECRET = nil

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'http://www.orkut.com/social/rpc'.freeze
    
    DEFAULT_ENDPOINT_REST = 'http://www.orkut.com/social/rest'.freeze
    
    DEFAULT_ENDPOINT_RPC = 'http://www.orkut.com/social/rpc'.freeze

    # By default, don't set a user oauth token
    DEFAULT_OAUTH_TOKEN = nil

    # By default, don't set a user oauth secret
    DEFAULT_OAUTH_TOKEN_SECRET = nil

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "Orkut Ruby Gem #{Orkut::Version}".freeze

    DEFAULT_CLIENT_ID = nil

    DEFAULT_CLIENT_SECRET = nil

    DEFAULT_SCOPE = 'https://www.googleapis.com/auth/orkut'.freeze

    DEFAULT_REDIRECT_URI = ''

    DEFAULT_REFRESH_TOKEN = nil

    DEFAULT_ACCESS_TOKEN = nil

    DEFAULT_EXPIRES_IN = nil

    DEFAULT_ISSUED_AT = nil

    DEFAULT_CODE = nil

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.site               = DEFAULT_SITE
      self.request_token_path = DEFAULT_REQUEST_TOKEN_PATH
      self.access_token_path  = DEFAULT_ACCESS_TOKEN_PATH
      self.authorize_path     = DEFAULT_AUTHORIZE_PATH
      self.consumer_key       = DEFAULT_CONSUMER_KEY
      self.consumer_secret    = DEFAULT_CONSUMER_SECRET
      self.endpoint           = DEFAULT_ENDPOINT
      self.endpoint_rest      = DEFAULT_ENDPOINT_REST
      self.endpoint_rpc       = DEFAULT_ENDPOINT_RPC
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.oauth_token_secret = DEFAULT_OAUTH_TOKEN_SECRET
      self.user_agent         = DEFAULT_USER_AGENT
      self.client_id          = DEFAULT_CLIENT_ID
      self.client_secret      = DEFAULT_CLIENT_SECRET
      self.scope              = DEFAULT_SCOPE
      self.redirect_uri       = DEFAULT_REDIRECT_URI
      self.refresh_token      = DEFAULT_REFRESH_TOKEN
      self.access_token       = DEFAULT_ACCESS_TOKEN
      self.expires_in         = DEFAULT_EXPIRES_IN
      self.issued_at          = DEFAULT_ISSUED_AT
      self.code               = DEFAULT_CODE
      self
    end

  end
end