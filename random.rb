# How to generate a random number in Ruby.
# Roll a 6 sided die, rand(6) returns a number from 0 to 5 inclusive
dice_roll_result = 1 + rand(6)
# display result to console
puts dice_roll_result

# ruby 1.92
lower_limit = 1
upper_limit = 6
result = Random.new.rand(lower_limit..upper_limit)

puts result
# Change your range operator to suit your needs
if dice_roll_result & result == 6
    dice_roll_result = 1 + rand(6)
    result
    puts ("you win")
else
    puts ("Next player")
end