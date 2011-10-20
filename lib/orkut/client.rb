require 'orkut/api'

module Orkut
  class Client < API
    
    require 'orkut/client/timelines'
    require 'orkut/client/messages'
    require 'orkut/client/albums'
    require 'orkut/client/comments'
    require 'orkut/client/mediaitems'
    require 'orkut/client/people'
    require 'orkut/client/videos'
    
    alias :api_endpoint :endpoint
    
    include Orkut::Client::Timelines
    include Orkut::Client::Messages
    include Orkut::Client::Albums
    include Orkut::Client::Comments
    include Orkut::Client::Mediaitems
    include Orkut::Client::People
    include Orkut::Client::Videos
  end
end
