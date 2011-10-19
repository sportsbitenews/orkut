module Orkut
  class Client
    # Defines methods related to timelines
    module Messages

      def home_timeline(options={})
        params = [{
          "params" => {
            "pageType" => "first",
            "messageType" => "public_message",
            "groupId" => "@friends",
            "count" => 20,
            "messageFormat" => "fullHtml"
          },
          "id" => "0-messages.get",
          "method" => "messages.get"
        }]
        headers = {'Content-Type' => 'application/json'}
        post(nil, params.to_s, headers).body
      end
    end
  end
end
