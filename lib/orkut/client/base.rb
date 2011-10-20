require 'orkut/version'
require 'orkut/constants/internal_constants'

module Orkut
  class Client
    module Base
      
      DEFAULT_COUNT = 40
      
      def default_headers
        return {
          Orkut::Constants::InternalConstants::CONTENT_TYPE => Orkut::Constants::InternalConstants::JSON_CONTENT_TYPE,
          Orkut::Constants::InternalConstants::ORKUT_CLIENT_LIB_HEADER => Orkut::Version.to_s
        }
      end
      
      def request_id
        @request_id = 0
        @request_id += 1
        @request_id
      end
    end
  end
end
