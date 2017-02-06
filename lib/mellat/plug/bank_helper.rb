# encoding: utf-8
require 'mellat/plug/unique_bank_code'
module Mellat
    
    module BankHelper
        def to_bank
            id=self.to_s[0...6]
            return Mellat::UniqueBankCode::IDS[id]
        end
        
        def bank_url
            id=self.to_s[0...6]
            return Mellat::UniqueBankCode::URLS[id]
        end
        
    end
    
end

class Integer
  # Patch Integer class to include `to_bank` method
  include Mellat::BankHelper
  
end

class String
  # Patch Integer class to include `to_bank` method
  include Mellat::BankHelper
end