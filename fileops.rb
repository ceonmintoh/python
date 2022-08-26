#THIS IS HOW WE CAN PERFORM FILE OPERATION IN RUBY
file = File.new('file.txt', 'w')
file.write("HELLO NELSON JM\n")
file.write('HOW IS YOUR DAY GOING!\n')
file.close
puts ('finish writing to file')

puts ("we're creating a new file now")
File.open('tmp.txt', 'w') do |f|
    f.write("NaNaNaNa\n")
    f.write('Batman!\n')
end
puts ("we finish writing to second file")

puts ("then another method of writing")
File.write('another.txt', "this is a new method\n" * 4 + 'it is very easy to use!\n')

#READING FILES