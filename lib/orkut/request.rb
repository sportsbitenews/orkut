module Orkut
  # Defines HTTP request methods
  module Request
    
    # Make a regular GET request using AccessToken
    #
    #   @response = @token.get('/people')
    #   @response = @token.get('/people', { 'Accept'=>'application/xml' })
    #
    def get(path = nil, headers = {})
      connection.get(verify_path(path), headers)
    end

    # Make a regular HEAD request using AccessToken
    #
    #   @response = @token.head('/people')
    #
    def head(path = nil, headers = {})
      connection.head(verify_path(path), headers)
    end

    # Make a regular POST request using AccessToken
    #
    #   @response = @token.post('/people')
    #   @response = @token.post('/people', { :name => 'Bob', :email => 'bob@mailinator.com' })
    #   @response = @token.post('/people', { :name => 'Bob', :email => 'bob@mailinator.com' }, { 'Accept' => 'application/xml' })
    #   @response = @token.post('/people', nil, {'Accept' => 'application/xml' })
    #   @response = @token.post('/people', @person.to_xml, { 'Accept'=>'application/xml', 'Content-Type' => 'application/xml' })
    #
    def post(path = nil, body = '', headers = {})
     connection.post(verify_path(path), body, headers)
    end

    # Make a regular PUT request using AccessToken
    #
    #   @response = @token.put('/people/123')
    #   @response = @token.put('/people/123', { :name => 'Bob', :email => 'bob@mailinator.com' })
    #   @response = @token.put('/people/123', { :name => 'Bob', :email => 'bob@mailinator.com' }, { 'Accept' => 'application/xml' })
    #   @response = @token.put('/people/123', nil, { 'Accept' => 'application/xml' })
    #   @response = @token.put('/people/123', @person.to_xml, { 'Accept' => 'application/xml', 'Content-Type' => 'application/xml' })
    #
    def put(path = nil, body = '', headers = {})
      connection.put(verify_path(path), body, headers)
    end

    # Make a regular DELETE request using AccessToken
    #
    #   @response = @token.delete('/people/123')
    #   @response = @token.delete('/people/123', { 'Accept' => 'application/xml' })
    #
    def delete(path = nil, headers = {})
      connection.delete(verify_path(path), headers)
    end
    
    def verify_path(path)
      path ||= endpoint
      path
    end
  end
end
