require 'orkut/client/base'
require 'orkut/constants/fields'
require 'orkut/constants/group'
require 'orkut/constants/internal_constants'
require 'orkut/constants/method_names'
require 'orkut/constants/params'
require 'multi_json'

module Orkut
  class Client
    module Comments 
      include Base
      # TODO implements features

      def get_comments(options={})
        params = {
          Orkut::Constants::Fields::USER_ID      => Orkut::Constants::InternalConstants::USERID_ME_SIMPLE,
          Orkut::Constants::Fields::ACTIVITY_ID  => options[:activity_id],
          Orkut::Constants::Fields::ALT          => Orkut::Constants::Params::JSON,
          Orkut::Constants::Fields::MAX_RESULTS  => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT).to_s,
          Orkut::Constants::Fields::EXTRA_PARAMS => options
        }
        unless options[:page_token].blank?
          params[Orkut::Constants::Fields::PAGE_TOKEN] = options[:page_token]
        end
        MultiJson.decode(execute(Orkut::Constants::Fields::COMMENTS, Orkut::Constants::Action::LIST, params))
      end

      def insert_comment(options={})

      end
    end
  end
end
