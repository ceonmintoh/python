#First we create a Queue:
sink = Queue.new
#Then 16 workers all generating a random number and pushing it into sink:
(1..16).to_a.map do
    Thread.new do
        sink << rand(1..100)
    end
end.map(&:join)
#And to get the data, convert a Queue to an Array:
data = [].tap { |a| a << sink.pop until sink.empty? }