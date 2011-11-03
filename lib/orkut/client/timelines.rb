require 'orkut/client/base'
require 'orkut/constants/action'
require 'orkut/constants/collection'
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

      def home_timeline_v1(options={})
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
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end
      
      def scraps_timeline_v1(options={})
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
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end
      
      def home_timeline(options={})
        params = {
          Orkut::Constants::Fields::USER_ID      => Orkut::Constants::InternalConstants::USERID_ME_SIMPLE,
          Orkut::Constants::Fields::COLLECTION   => Orkut::Constants::Collection::STREAM,
          Orkut::Constants::Fields::ALT          => Orkut::Constants::Params::JSON,
          Orkut::Constants::Fields::MAX_RESULTS  => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT).to_s,
          Orkut::Constants::Fields::EXTRA_PARAMS => options
        }
        unless options[:page_token].blank?
          params[Orkut::Constants::Fields::PAGE_TOKEN] = options[:page_token]
        end
        MultiJson.decode(execute(Orkut::Constants::Fields::ACTIVITIES, Orkut::Constants::Action::LIST, params))
      end

      def scraps_timeline(options={})
        params = {
          Orkut::Constants::Fields::USER_ID      => Orkut::Constants::InternalConstants::USERID_ME_SIMPLE,
          Orkut::Constants::Fields::COLLECTION   => Orkut::Constants::Collection::SCRAPS,
          Orkut::Constants::Fields::ALT          => Orkut::Constants::Params::JSON,
          Orkut::Constants::Fields::MAX_RESULTS  => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT).to_s,
          Orkut::Constants::Fields::EXTRA_PARAMS => options
        }
        unless options[:page_token].blank?
          params[Orkut::Constants::Fields::PAGE_TOKEN] = options[:page_token]
        end
        MultiJson.decode(execute(Orkut::Constants::Fields::ACTIVITIES, Orkut::Constants::Action::LIST, params))
      end
    end
  end
end
