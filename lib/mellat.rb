require "mellat/version"
require "mellat/requisition"
require "mellat/respond"

module Mellat

  class << self
    attr_accessor :configuration
  end
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :terminalId, :userName, :userPassword, :wsdl, :callBackUrl
    def initialize

    end

  end

end
