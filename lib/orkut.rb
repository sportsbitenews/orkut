require 'orkut/client'
require 'orkut/config'

module Orkut
  extend Config
  class << self
    # Alias for Orkut::Client.new
    #
    # @return [Orkut::Client]
    def new(options={})
      Orkut::Client.new(options)
    end

    # Delegate to Orkut::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
