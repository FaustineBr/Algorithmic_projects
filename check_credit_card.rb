def check_credit_card()
    print "\nEntrez le numéro de carte : "
    card_numbers = ask_card_numbers()
    format_number = format_card(card_numbers) 
    result = check_validity(format_number)
end  
 
def ask_card_numbers()
    user_entry = gets.chomp.to_s.delete(' ')
    card_numbers =  check_entry(user_entry)
    if card_numbers
        card_numbers
    else
        print "\nMauvaise saisie, veuillez réessayer : " ;
        ask_card_numbers()
    end
end

def check_entry(card_numbers)
    check_special_char = card_numbers.match(/\D/) ? false : true
    check_length = card_numbers.length == 16 ? true : false 
    check_special_char && check_length ? card_numbers : false  
end

def format_card(card_numbers)
    format_numbers = card_numbers.chars.map(&:to_i)
    return format_numbers
end 

def check_validity(format_number)
    even = []
    odd = []
    format_number.each_with_index { |x,index|
        if (index % 2).zero?
            x2 = double(x) ;
            even.push(x2)
        else  
            odd.push(x)
        end 
    }
    sum = even.sum + odd.sum
    print "\nresult : #{sum}"
    if (sum % 10).zero?
        print "\n\nLe numéro est valide !"
    else
        print "\n\nLe numéro n'est pas valide !"
    end 
end

def double(x)
    x *= 2
    x > 9 ? x -= 9 : x
    return x
end

check_credit_card()