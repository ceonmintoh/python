#Let's start by defining and populating two queues:
q1 = Queue.new
q2 = Queue.new
(1..100).each { |e| q1 << e }
(101..200).each { |e| q2 << e }
#We should create another queue and push data from other threads into it:
merged = Queue.new

[q1, q2].map do |q|
    Thread.new do
        loop do
        merged << q.pop
        end
    end
end