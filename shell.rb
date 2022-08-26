#Popen3 runs in a sub-process and returns stdin, stdout, stderr and wait_thr.
require 'open3'
stdin, stdout, stderr, wait_thr = Open3.popen3("sleep 5s && ls")
puts ("We'll use open3 to print files in the current directry")
puts "#{stdout.read} #{stderr.read} #{wait_thr.value.exitstatus}"
puts ("finished printing list")

cmd = 'uname -a'
Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    puts "Your Computer is:\n" + stdout.read
    puts "stderr is:" + stderr.read
end
