class Person
  attr_accessor :name
  def initialize
  @name = name
  end
end
########################################
class Voter < Person
  attr_accessor :politics, :name
  @@voterss = []
  def initialize(politics)
  @politics = politics
  end
  def save
     @@voterss << self
  end

  def self.list
    return @@voterss
  end
  # def self.updates
  #   return @@voter
  # end
  def self.delete
    return @@voterss.clear
  end
end
##########################################
class Politician < Voter
  attr_accessor :party
  @@politician = []

  def initialize(party)
  @party = party
  end
  def save
    @@politician << self
  end
  def self.list
    return @@politician
  end
  # def self.update
  #   return @@politician
  # end
  def delete
    return @@politician.clear
  end

end
######################################################################
def listing
  puts "Current Voters List:"
   Voter.list.each do |x|
   puts "#{x.name} #{x.politics}"
  end
  puts
  puts "Current Politician List:"

   Politician.list.each do |y|
   puts "#{y.name} #{y.party}"

  end
  puts

 end
#######################################################################
def updating(name)


    if name.class == Politician

      if  name.party == "Republican"
          name.party = "Democratic"
          #name.save
          puts "Now you are registered as a Democratic"
          puts
      elsif name.party == "Democratic"
            name.party = "Republican"
          puts "Now you are registered as a Republican"
          #name.save
          puts
      end

    else

      puts "Politics?"
      puts "(L)iberal, (C)onservative, (Tea) Party, (S)ocialist, (N)eutral"
      politics = gets.chomp


      case politics
      when "L"
        name.politics = "Liberal"
        #name.save
        #welcome
      when "C"
        name.politics = "Conservative"
        #name.save
        #welcome
      when "T"
        name.politics = "Tea Party"
        #name.save
        #welcome
      when "S"
        name.politics = "Socialist"
        #name.save
        #welcome
      when "N"
        name.politics = "Neutral"
        #name.save
        #welcome
      else
        puts
        puts "wrong entry. Let me ask you again."
        puts "Politics?"
        puts "(L)iberal, (C)onservative, (Tea) Party, (S)ocialist, (N)eutral"
        politics = gets.chomp
      end

    end



end
######################################################################
def deleting(name)

  if name.class == Politician

    if  name.party == "Republican"
        name.party = "Democratic"
        name.party.clear
        #name.save
        puts "Now you are not registered"
        puts
    elsif name.party == "Democratic"
          name.party = "Republican"
          name.party.clear
        puts "Now you are not registered"
        #name.save
        puts
    end

  else


    puts "Politics you want to clear?"
    puts "(L)iberal, (C)onservative, (Tea) Party, (S)ocialist, (N)eutral"
    politics = gets.chomp


    case politics
    when "L"
      name.politics = "Liberal"
      name.politics.clear
      #name.save
      #welcome
    when "C"
      name.politics = "Conservative"
      name.politics.clear
      #name.save
      #welcome
    when "T"
      name.politics = "Tea Party"
      name.politics.clear
      #name.save
      #welcome
    when "S"
      name.politics = "Socialist"
      name.politics.clear
      #name.save
      #welcome
    when "N"
      name.politics = "Neutral"
      name.politics.clear
      #name.save
      #welcome
    else
      puts
      puts "wrong entry. Let me ask you again."
      puts "Politics?"
      puts "(L)iberal, (C)onservative, (Tea) Party, (S)ocialist, (N)eutral"
      politics = gets.chomp
    end

  end


end
#######################################################################
def voter_or_politician
  puts "What would you like to create? (P)olitician or (V)oter?"
  create = gets.chomp
  case create
  when "P"
    puts "Name?"
    name = gets.chomp
    politician(name)
  when "V"
    puts "Name?"
    name = gets.chomp
    voter(name)
  else
    puts "wrong entry"
    voter_or_politician
  end
end
##############################################################
def deleting_first
  puts "who would you like to delete?"
  deleting_person = gets.chomp
  puts
  result1 = Voter.list.select{|x| x.name == deleting_person}
  result2 = Politician.list.select{|x| x.name == deleting_person}

  result3 = result1 + result2

  if (result3).count == 1
    deleting(result3[0])
  else
    puts "This person is not in my list"
    deleting_first
  end
end

def result1_result2
  puts "Who would you like to update?"
  updating_person = gets.chomp
  puts

  result1 = Voter.list.select{|x| x.name == updating_person}
  result2 = Politician.list.select{|x| x.name == updating_person}


   result3 = result1 + result2

  if (result3).count == 1

      updating(result3[0])
  else
      puts "This person is not in my list"
      result1_result2
  end

end
  ##############################################################
def welcome
  puts "Welcome to the voting table"
  puts "What would you like to do"
  puts "(C)reate, (L)list, (U)pdate, or (D)elete"

  user_entry = gets.chomp
  while user_entry != "q"

  case user_entry
  when "C"
    puts
     voter_or_politician
  when "L"
    puts
    listing
  when  "U"
      result1_result2
  when "D"
    puts
    deleting_first
  else
    puts
    puts "wrong entry"
    welcome
  end

  puts "Welcome to the voting table"
  puts "What would you like to do"
  puts "(C)reate, (L)list, (U)pdate, or (D)elete"

  user_entry = gets.chomp
  puts

  end
end
##########################################################################
  def voter(name)
    #  puts "Name?"
    #  name = gets.chomp
    puts "Politics?"
    puts "(L)iberal, (C)onservative, (Tea) Party, (S)ocialist, (N)eutral"


    politics = gets.chomp
    #while politics != "q"

    case politics
    when "L"
      person = Voter.new("Liberal")
      person.name = name
      person.save
      welcome
    when "C"
      person = Voter.new("Conservative")
      person.name = name
      person.save
      welcome
    when "T"
      person = Voter.new("Tea Party")
      person.name = name
      person.save
      welcome
    when "S"
      person = Voter.new("Socialist")
      person.name = name
      person.save
      welcome
    when "N"
      person = Voter.new("Neutral")
      person.name = name
      person.save
      welcome
    else
      puts
      puts "wrong entry. Let me ask you again."
      voter(name)
    end

  end
##########################################################################
  def politician(name)


    puts "What party are you"
    puts "(D)emocratic or (R)epublican"
    party = gets.chomp
    case party
    when "D"
     person_pol = Politician.new("Democratic")
     person_pol.name = name
     person_pol.save
     puts
     welcome

    when "R"
      person_pol = Politician.new("Republican")
      person_pol.name = name
      person_pol.save
      puts
      welcome
    else
      puts "Wrong entry. Let me ask you again"
      politician(name)
    end
  end
  ######################################################################
voter = Voter.new("Conservative")
voter.name = "Jaime"
voter.save
voter = Voter.new("Neutral")
voter.name = "Maria"
voter.save

politician = Politician.new("Republican")
politician.name = "Luis"
politician.save
politician = Politician.new("Democratic")
politician.name = "Andres"
politician.save

welcome
######################################################################
