require "savon"

module Mellat

  class BpPayRequest
    attr_accessor :orderId, :amount, :localDate, :localTime, :additionalData, :payerId, :callBackUrl
    attr_reader   :respond

    def initialize(args = {})
      @orderId          = args.fetch[:orderId] 
      @amount	        = args.fetch[:amount]
      @localDate  	    = args.fetch[:localDate] || Time.now.strftime("%Y%d%m")
      @localTime   		= args.fetch[:localTime] || Time.now.strftime("%H%M%S")
      @additionalData   = args.fetch[:additionalData]
      @payerId			= args.fetch[:payerId]
      @callBackUrl		= Mellat.configuration.callBackUrl || args.fetch[:callBackUrl]
      @wsdl       		= Savon.client(wsdl: Mellat.configuration.wsdl, pretty_print_xml: true)
      @response   	    = RespondBpPayRequest.new
    end

    def call
      response = @wsdl.call :BpPayRequest, message: {
        'orderId'        => @orderId,
        'amount'         => @amount,
        'localDate'      =>	@localDate,
        'localTime'      => @localTime,
        'additionalData' => @message,
        'payerId' 		 => @payerId,
        'callBackUrl'	 => @callBackUrl
      }
      @response.validate(response.body)
    end

  end


end