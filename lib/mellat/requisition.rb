require "savon"

module Mellat

  class BpPayRequest
    attr_accessor :orderId, :amount, :localDate, :localTime, :additionalData, :payerId, :callBackUrl
    attr_reader   :respond

    def initialize(args = {})
      @orderId          = args.fetch(:orderId)
      @amount	        = args.fetch(:amount)
      @localDate  	    = args.fetch(:localDate,Time.now.strftime("%Y%d%m"))
      @localTime   		= args.fetch(:localTime,Time.now.strftime("%H%M%S"))
      @additionalData   = args.fetch(:additionalData,' ')
      @payerId		    = args.fetch(:payerId,0)
      @callBackUrl		= args.fetch(:callBackUrl,Mellat.configuration.callBackUrl)
      @terminalId		= Mellat.configuration.terminalId
      @userName		    = Mellat.configuration.userName
      @userPassword		= Mellat.configuration.userPassword
      @wsdl       		= Savon.client(wsdl: Mellat.configuration.wsdl, pretty_print_xml: true,namespace: 'http://interfaces.core.sw.bps.com/')
      @response   	    = RespondBpPayRequest.new()
    end

    def call
      response = @wsdl.call :bp_pay_request, message: {
      	'terminalId'     => @terminalId,
      	'userName'       => @userName,
      	'userPassword'   => @userPassword,
        'orderId'        => @orderId,
        'amount'         => @amount,
        'localDate'      => @localDate.to_s,
        'localTime'      => @localTime.to_s,
        'additionalData' => @additionalData,
        'payerId' 		 => @payerId,
        'callBackUrl'	 => @callBackUrl
      }
      @response.validate(response.body)
    end

  end

end