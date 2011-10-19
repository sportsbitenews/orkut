require 'orkut/authenticatable'
require 'orkut/config'
require 'orkut/connection'
require 'orkut/request'

module Orkut
  class API
    include Authenticatable
    include Connection
    include Request

    attr_accessor *Config::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Orkut.options.merge(options)
      Config::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end
end
