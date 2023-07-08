# your code goes here
class Person
    attr_reader :name
    attr_accessor :bank_account
    attr_reader :happiness
    attr_reader :hygiene
  
    def initialize(name)
      @name = name
      @bank_account = 25
      @happiness = 8
      @hygiene = 8
    end
  
    def bank_account=(value)
      @bank_account = value
    end
  
    def happiness=(value)
      @happiness = value.clamp(0, 10)
    end
  
    def hygiene=(value)
      @hygiene = value.clamp(0, 10)
    end
  
    def clean?
      hygiene > 7
    end
  
    def happy?
      happiness > 7
    end
  
    def get_paid(amount)
      self.bank_account += amount
      "all about the benjamins"
    end
  
    def take_bath
      self.hygiene += 4
      "♪ Rub-a-dub just relaxing in the tub ♫"
    end
  
    def work_out
      self.happiness += 2
      self.hygiene -= 3
      "♪ another one bites the dust ♫"
    end
  
    def call_friend(friend)
      self.happiness += 3
      friend.happiness += 3
      "Hi #{friend.name}! It's #{self.name}. How are you?"
    end
  
    def start_conversation(friend, topic)
      case topic
      when "politics"
        self.happiness -= 2
        friend.happiness -= 2
        "blah blah partisan blah lobbyist"
      when "weather"
        self.happiness += 1
        friend.happiness += 1
        "blah blah sun blah rain"
      else
        "blah blah blah blah blah"
      end
    end
  end

  stella = Person.new("Stella")
stella.name # => "Stella"
stella.bank_account # => 25
stella.bank_account = 100
stella.bank_account # => 100
stella.happiness # => 8
stella.happiness = 5
stella.happiness # => 5
stella.hygiene # => 8
stella.hygiene = 3
stella.hygiene # => 3
stella.clean? # => false
stella.happy? # => false
stella.get_paid(500) # => "all about the benjamins"
stella.bank_account # => 600
stella.take_bath # => "♪ Rub-a-dub just relaxing in the tub ♫"
stella.hygiene # => 7
stella.work_out # => "♪ another one bites the dust ♫"
stella.happiness # => 7

felix = Person.new("Felix")
stella.call_friend(felix) # => "Hi Felix! It's Stella. How are you?"
stella.happiness # => 10
felix.happiness # => 11 (maximum value is 10)

stella.start_conversation(felix, "politics") # => "blah blah partisan blah lobbyist"
stella.happiness # => 8
felix.happiness # => 8
