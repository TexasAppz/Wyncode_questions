
def input
 puts "How much is the bill?"
 bill = gets.to_f
 sub_total = bill + tax_calc(bill)
 total_tip = tip_calc(bill)
 total = sub_total + total_tip
 ind_share = share(total)
 total_tax = sub_total - bill

 puts "=" * 50
 puts "Tax: $#{'%.02f' % total_tax}"
 puts "Subtotal: $#{'%.02f' % sub_total}"
 puts "Tip Amount is $#{'%.02f' % total_tip}"
 puts "Grand total is $#{'%.02f' % total}"
 puts "=" * 50
 puts "Split bill is $#{'%.02f' % ind_share}"
 puts "\nThank you come again!"

end

def tax_calc (bill_amount)
 puts "What is the tax amount in your area?"
 tax_amount = gets.chomp.to_f
 return bill_amount * tax_amount/100
end

def tip_calc (bill_amount)
 puts "What tip percentage you want to leave?"
 puts "10% = $#{'%.02f' % (bill_amount*0.10)}"
 puts "15% = $#{'%.02f' % (bill_amount*0.15)}"
 puts "20% = $#{'%.02f' % (bill_amount*0.20)}"
 puts "Or enter any other percentage"
 tip_amount = gets.chomp.to_f
 return bill_amount * tip_amount/100

end

def share (total)
 puts "How many people in your table?"
 number_of_people = gets.chomp.to_i
 if number_of_people <= 0
   puts "You are a person! You have value to us :D"
   number_of_people = gets.chomp.to_i
 end
 return total/number_of_people
end




input
