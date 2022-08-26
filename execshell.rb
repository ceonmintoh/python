# Clasic ways to execute shell code in Ruby:
# Exec:
exec 'echo "hello world"'
# or
exec ('echo "hello world"')
# The System Command:
system 'echo "hello world"'
# Will output "hello world" in the command window. or
system ('echo "hello world"')
# The system command can return a true if the command was successful or nill when not.
result = system 'echo "hello world"'
puts result # will return a true in the command window

result = `echo "hello world"`
puts "We always code a " + result

#IO.popen:
# Will get and return the current date from the system
IO.popen("date") { |f| puts f.gets }