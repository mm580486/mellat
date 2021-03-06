module Mellat

  class RespondBpPayRequest
  	
    attr_reader :respond, :status,:statusmessage
    def validate(response = nil)
      @response = response
      perform_validation
      return self
    end

    def valid?
      @valid
    end


    def refID
    	@RefID.to_s
    end

    private

    def perform_validation
      raise ArgumentError, 'not a valid response' if @response.nil?
      @status = @response[:bp_pay_request_response][:return]
      @valid  = (@status.split(',')[0].to_i==0)
      @RefID  = @status.split(',')[1] if @valid
    end

  end

end