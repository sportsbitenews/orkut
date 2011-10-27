require 'orkut/client/base'
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
      include Base

      def home_timeline(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::GROUP_ID    => Orkut::Constants::Group::ALL,
            Orkut::Constants::Fields::USER_ID     => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Fields::COUNT       => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT),
            Orkut::Constants::Fields::COALESCE    => true,
            Orkut::Constants::Fields::START_INDEX => 0
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::ACTIVITIES_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::ACTIVITIES_GET
        }]
        unless options[:updated_before].blank?
          params.first[Orkut::Constants::Fields::PARAMS][Orkut::Constants::Fields::UPDATED_BEFORE] = format_datetime(options[:updated_before])
        end
        MultiJson.decode(post(nil, params.to_s, default_headers).body)
      end
      
      def scraps_timeline(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::PAGE_TYPE      => Orkut::Constants::Params::PageType::FIRST,
            Orkut::Constants::Fields::MESSAGE_TYPE   => Orkut::Constants::InternalConstants::Values::PUBLIC_MESSAGE,
            Orkut::Constants::Fields::GROUP_ID       => Orkut::Constants::Group::FRIENDS,
            Orkut::Constants::Fields::USER_ID        => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Fields::COUNT          => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT),
            Orkut::Constants::Fields::MESSAGE_FORMAT => Orkut::Constants::Params::MessageFormat::FULL_HTML
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::MESSAGES_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::MESSAGES_GET
        }]
        MultiJson.decode(post(nil, params.to_s, default_headers).body)
      end
      
      def home_timeline22(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::FIELDS => ['comments'],
            Orkut::Constants::Fields::GROUP_ID    => Orkut::Constants::Group::ALL,
            Orkut::Constants::Fields::USER_ID     => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Fields::COUNT       => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT),
            Orkut::Constants::Fields::COALESCE    => true,
            Orkut::Constants::Fields::START_INDEX => 0
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::ACTIVITIES_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::ACTIVITIES_GET
        }]
        unless options[:updated_before].blank?
          params.first[Orkut::Constants::Fields::PARAMS][Orkut::Constants::Fields::UPDATED_BEFORE] = format_datetime(options[:updated_before])
        end
        MultiJson.decode(post(nil, params.to_s, default_headers).body)
      end
    end
  end
end
