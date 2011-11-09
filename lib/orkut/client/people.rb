require 'orkut/client/base'
require 'orkut/constants/fields'
require 'orkut/constants/group'
require 'orkut/constants/internal_constants'
require 'orkut/constants/method_names'
require 'orkut/constants/params'
require 'multi_json'

module Orkut
  class Client
    # Defines methods related to people, friends and contacts
    module People 
      include Base
      
      def list_friends(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::GROUP_ID    => Orkut::Constants::Group::FRIENDS,
            Orkut::Constants::Fields::USER_ID     => Orkut::Constants::InternalConstants::USERID_ME,
            Orkut::Constants::Fields::COUNT       => (options[:count] || Orkut::Client::Base::DEFAULT_COUNT),
            Orkut::Constants::Fields::START_INDEX => 0
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::PEOPLE_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::PEOPLE_GET
        }]
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end

      #[{"id"=>"1-people.get", "data"=>{"gender"=>"male", "status"=>"Realização de Testes via Agregador", "profileUrl"=>"/Profile.aspx?uid=143766589716977679&mt=os", "addresses"=>[{"region"=>"São Paulo", "locality"=>"São Paulo", "type"=>"currentLocation", "country"=>"BR"}], "isViewer"=>true, "id"=>"13930868467330630793", "thumbnailUrl"=>"http://img6.orkut.com/images/small/662/5462662.jpg", "name"=>{"familyName"=>"Bersani Pereira", "givenName"=>"Ygor Eduardo"}, "currentLocation"=>{"region"=>"São Paulo", "locality"=>"São Paulo", "longitude"=>0.0, "latitude"=>0.0, "type"=>"currentLocation", "country"=>"BR"}}}]
      def get_person_full_profile(options={})
        params = [{
          Orkut::Constants::Fields::PARAMS => {
            Orkut::Constants::Fields::FIELDS => [
                Orkut::Constants::Fields::NAME,
                Orkut::Constants::Fields::THUMBNAIL_URL,
                Orkut::Constants::Fields::PROFILE_URL,
                Orkut::Constants::Fields::STATUS,
                Orkut::Constants::Fields::EMAILS,
                Orkut::Constants::Fields::GENDER,
                Orkut::Constants::Fields::PHONE_NUMBERS,
                Orkut::Constants::Fields::BIRTHDAY,
                Orkut::Constants::Fields::CURRENT_LOCATION
            ],
            Orkut::Constants::Fields::GROUP_ID => Orkut::Constants::Group::SELF,
            Orkut::Constants::Fields::USER_ID => (options[:user_id] || Orkut::Constants::InternalConstants::USERID_ME)
          },
          Orkut::Constants::Fields::ID     => request_id.to_s+'-'+Orkut::Constants::MethodNames::PEOPLE_GET,
          Orkut::Constants::Fields::METHOD => Orkut::Constants::MethodNames::PEOPLE_GET
        }]
        MultiJson.decode(post_v1(nil, params.to_s, default_headers).body)
      end
      
    end
  end
end