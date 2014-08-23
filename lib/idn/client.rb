require 'cgi'

module Idn

  class Client
    include Helpers::Request

    attr_reader :client_token, :client_secret, :client_options

    def initialize(ctoken=Idn.token, csecret=Idn.secret, options={})
      @client_token   = ctoken
      @client_secret  = csecret
      @client_options = options
    end
  end

end