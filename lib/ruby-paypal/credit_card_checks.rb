#
# Performs a series of credit card number checks.
#
module CreditCardChecks  
  # Perform Luhn check on a credit card number. Refer to http://en.wikipedia.org/wiki/Luhn_algorithm
  # 
  def luhn_check(number)
    check_sum = 0
    number.reverse.split('').map(&:to_i).each_with_index do |digit, index|
      check_sum += (index % 2 == 0 ? digit : (digit * 2) / 10 + (digit * 2) % 10)
    end
    check_sum % 10 == 0
  end
  
  # Perform checks on credit card numbers with reference to the length of the credit card number
  # and the type of credit card. Refer to http://en.wikipedia.org/wiki/Credit_card_number
  #
  def card_type_check(type, number)
    validity = false
    case type.upcase
      when "VISA"
        validity = true if (number.length == 16 or number.length == 13) and number[0,1] == "4"
      when "MASTERCARD"
        validity = true if (number.length == 16) and (51..55).include?(number[0,2].to_i)
      when "AMEX"
        validity = true if (number.length == 15) and ['34', '37'].include?(number[0,2])
      when "DISCOVER"
        validity = true if (number.length == 16) and (number[0,2] == "65" or number[0,4] == "6011")
      when "SWITCH"
        # TODO checks for Switch cards
        validity = true
      when "SOLO"
        # TODO checks for Solo cards
        validity = true
      else
        raise "Invalid card type entered"
    end
    
    return validity
  end
  
  
  
end
