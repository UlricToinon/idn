require "idn/version"
require 'oauth2'

module Idn

  class << self
    attr_accessor :token, :secret

    def configure
      yield self
      true
    end
  end

  autoload :Client, 'idn/client'
  autoload :Helpers, 'idn/helpers'
end
