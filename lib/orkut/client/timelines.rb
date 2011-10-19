require 'orkut/constants/fields'
require 'orkut/constants/group'
require 'orkut/constants/internal_constants'
require 'orkut/constants/method_names'
require 'orkut/constants/params'
require 'multi_json'

module Orkut
  class Client
    # Defines methods related to timelines
    module Timelines
      
      DEFAULT_COUNT = 40

      def home_timeline(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Params::GROUP_ID    => Orkut::Constants::Group::ALL,
            Orkut::Constants::Params::USER_ID     => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Params::COUNT       => (options[:count] || DEFAULT_COUNT),
            Orkut::Constants::Fields::COALESCE    => true,
            Orkut::Constants::Fields::START_INDEX => 0
          },
          Orkut::Constants::Fields::ID     => ''+Orkut::Constants::MethodNames::ACTIVITIES_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::ACTIVITIES_GET
        }]
        MultiJson.decode(post(nil, params.to_s, default_headers).body)
      end
      
      def scraps_timeline(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::PAGE_TYPE      => Orkut::Constants::Params::PageType::FIRST,
            Orkut::Constants::Fields::MESSAGE_TYPE   => Orkut::Constants::InternalConstants::Values::PUBLIC_MESSAGE,              
            Orkut::Constants::Params::GROUP_ID       => Orkut::Constants::Group::FRIENDS,
            Orkut::Constants::Params::USER_ID        => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Params::COUNT          => (options[:count] || DEFAULT_COUNT),
            Orkut::Constants::Fields::MESSAGE_FORMAT => Orkut::Constants::Params::MessageFormat::FULL_HTML
          },
          Orkut::Constants::Fields::ID     => '-'+Orkut::Constants::MethodNames::MESSAGES_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::MESSAGES_GET
        }]
        MultiJson.decode(post(nil, params.to_s, default_headers).body)
      end
      
      def default_headers
        return {
          Orkut::Constants::InternalConstants::CONTENT_TYPE => Orkut::Constants::InternalConstants::JSON_CONTENT_TYPE,
          Orkut::Constants::InternalConstants::ORKUT_CLIENT_LIB_HEADER => Orkut::Version.to_s
        }
      end
    end
  end
end
