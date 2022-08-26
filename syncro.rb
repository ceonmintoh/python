syncer = Queue.new
a = Thread.new do
    syncer.pop
    puts "this happens at end"
end
b = Thread.new do
    puts "this happens first"
    STDOUT.flush
    syncer << :ok
end
[a, b].map(&:join)