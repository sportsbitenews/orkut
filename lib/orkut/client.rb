require 'orkut/api'

module Orkut
  class Client < API
    
    require 'orkut/client/timelines'
    
    alias :api_endpoint :endpoint
    
    include Orkut::Client::Timelines
  end
end
