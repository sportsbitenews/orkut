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
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::GROUP_ID    => Orkut::Constants::Group::SELF,
            Orkut::Constants::Fields::USER_ID     => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Fields::COUNT       => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT),
            Orkut::Constants::Fields::START_INDEX => 0,
            Orkut::Constants::Fields::TYPE        => Orkut::Constants::Fields::ACTIVITIES,
            Orkut::Constants::Fields::ACTIVITY_ID => options[:activity_id]
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::COMMENTS_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::COMMENTS_GET
        }]
        MultiJson.decode(post(nil, params.to_s, default_headers).body)
      end
    end
  end
end
