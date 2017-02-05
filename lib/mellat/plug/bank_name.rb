# encoding: utf-8
require 'mellat/plug/unique_bank_code'
module Mellat
    
    
    def to_bank
        id=self[0..6].to_s
        return Mellat::UniqueBankCode::IDS[id]
        
        
    end
    
    
end