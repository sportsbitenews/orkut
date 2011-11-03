require 'orkut/error'
module Orkut
  # Defines HTTP request methods
  module Request
    
    # Make a regular GET request using AccessToken
    #
    #   @response = @token.get('/people')
    #   @response = @token.get('/people', { 'Accept'=>'application/xml' })
    #
    def get_v1(path = nil, headers = {})
      connection_v1.get(verify_path(path), headers)
    end

    # Make a regular HEAD request using AccessToken
    #
    #   @response = @token.head('/people')
    #
    def head_v1(path = nil, headers = {})
      connection_v1.head(verify_path(path), headers)
    end

    # Make a regular POST request using AccessToken
    #
    #   @response = @token.post('/people')
    #   @response = @token.post('/people', { :name => 'Bob', :email => 'bob@mailinator.com' })
    #   @response = @token.post('/people', { :name => 'Bob', :email => 'bob@mailinator.com' }, { 'Accept' => 'application/xml' })
    #   @response = @token.post('/people', nil, {'Accept' => 'application/xml' })
    #   @response = @token.post('/people', @person.to_xml, { 'Accept'=>'application/xml', 'Content-Type' => 'application/xml' })
    #
    def post_v1(path = nil, body = '', headers = {})
     connection_v1.post(verify_path(path), body, headers)
    end

    # Make a regular PUT request using AccessToken
    #
    #   @response = @token.put('/people/123')
    #   @response = @token.put('/people/123', { :name => 'Bob', :email => 'bob@mailinator.com' })
    #   @response = @token.put('/people/123', { :name => 'Bob', :email => 'bob@mailinator.com' }, { 'Accept' => 'application/xml' })
    #   @response = @token.put('/people/123', nil, { 'Accept' => 'application/xml' })
    #   @response = @token.put('/people/123', @person.to_xml, { 'Accept' => 'application/xml', 'Content-Type' => 'application/xml' })
    #
    def put_v1(path = nil, body = '', headers = {})
      connection_v1.put(verify_path(path), body, headers)
    end

    # Make a regular DELETE request using AccessToken
    #
    #   @response = @token.delete('/people/123')
    #   @response = @token.delete('/people/123', { 'Accept' => 'application/xml' })
    #
    def delete_v1(path = nil, headers = {})
      connection_v1.delete(verify_path(path), headers)
    end

    def execute(entity, action, params = {}, body = '')
      raise(Orkut::Error, 'Parameters entity and action cannot be nil') if entity.blank? or action.blank?
      raise(Orkut::Error, 'Parameter body cannot be nil or empty') if params.blank? or params.empty?

      extra = params.delete(Orkut::Constants::Fields::EXTRA_PARAMS)

      orkut = connection.discovered_api('orkut', 'v2')
      response = connection(extra).execute(orkut.try(entity.to_sym).try(action.to_sym), params, body)
      status, headers, body = response
      return body.first if status == 200
      ''
    end
    
    def verify_path(path)
      path ||= endpoint
      path
    end
  end
end
