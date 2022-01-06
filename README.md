# Oystercard Challenge

This challenge was to build a more complex system.


## User stories

Here are the user stories you will be working on for this project:

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```


## Feature Tests
User Story: 
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

```
~/Projects/makers-dec/oystercard main ❯ irb -r './lib/oystercard.rb'                                                                        2.7.1
2.7.1 :001 > card = Oystercard.new
2.7.1 :002 > card.top_up(30)
 => nil 
2.7.1 :003 > card.balance
 => 30 
2.7.1 :004 > card.deduct(3)
Traceback (most recent call last):
        4: from /Users/hannah/.rvm/rubies/ruby-2.7.1/bin/irb:23:in `<main>'
        3: from /Users/hannah/.rvm/rubies/ruby-2.7.1/bin/irb:23:in `load'
        2: from /Users/hannah/.rvm/rubies/ruby-2.7.1/lib/ruby/gems/2.7.0/gems/irb-1.2.3/exe/irb:11:in `<top (required)>'
        1: from (irb):4
NoMethodError (undefined method `deduct' for #<Oystercard:0x00007f84730d87d0 @balance=30>)
2.7.1 :005 > 
```
