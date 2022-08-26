require 'open3'
cmd = 'ping www.google.com'
Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    while line = stdout.gets
        puts line
    end
puts ("Ping completed")
end