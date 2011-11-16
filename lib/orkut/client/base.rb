require 'orkut/version'
require 'orkut/error'
require 'orkut/constants/internal_constants'

module Orkut
  class Client
    module Base
      
      DEFAULT_COUNT = 40

      DEFAULT_DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%SZ'

      DEFAULT_LANGUAGE = 'pt_BR'
      
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

      def format_datetime datetime
        if datetime.kind_of?(Time)
          return datetime.utc.strftime(DEFAULT_DATETIME_FORMAT)
        elsif datetime.kind_of?(String)
          return Time.at(datetime).utc.strftime(DEFAULT_DATETIME_FORMAT)
        else
          raise(Orkut::Error, 'Invalid datetime')
        end
      end

      def get_refresh_token
        get_refresh_access_token
      end
    end
  end
end
