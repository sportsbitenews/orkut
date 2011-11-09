require 'orkut/error'
require 'orkut/client/base'

module Orkut
  class Client
    module Messages 
      include Base

      def post_message(options={})
        raise(Orkut::Error, "Parameters body cannot be nil") if options[:body].blank?
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::GROUP_ID => Orkut::Constants::Group::SELF,
            Orkut::Constants::Fields::USER_ID  => Orkut::Constants::InternalConstants::USERID_VIEWER,
            Orkut::Constants::Fields::APP_ID   => Orkut::Constants::InternalConstants::Values::APP,
            Orkut::Constants::Fields::ACTIVITY => {
              Orkut::Constants::Fields::TITLE => options[:title],
              Orkut::Constants::Fields::BODY  => options[:body]
            }
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::CREATE_ACTIVITIES,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::CREATE_ACTIVITIES
        }]
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end
      
      def post_scrap(options={})
        raise(Orkut::Error, "Parameters user_id and body cannot be nil") if options[:user_id].blank? and options[:body].blank?
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::MESSAGE_TYPE => Orkut::Constants::InternalConstants::Values::PUBLIC_MESSAGE,
            Orkut::Constants::Fields::GROUP_ID     => Orkut::Constants::Group::SELF,
            Orkut::Constants::Fields::USER_ID      => (options[:user_id] || Orkut::Constants::InternalConstants::USERID_VIEWER),
            Orkut::Constants::Fields::MESSAGE => {
              Orkut::Constants::Fields::BODY  => options[:body]
            }
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::MESSAGES_CREATE,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::MESSAGES_CREATE
        }]
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end

      def update_status(options={})
        raise(Orkut::Error, "Parameters body cannot be nil") if options[:body].blank?
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::GROUP_ID     => Orkut::Constants::Group::SELF,
            Orkut::Constants::Fields::USER_ID      => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Fields::PERSON => {
              Orkut::Constants::Fields::STATUS  => options[:status]
            }
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::PEOPLE_UPDATE,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::PEOPLE_UPDATE
        }]
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end
    end
  end
end
