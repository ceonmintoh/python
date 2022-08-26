=begin
In Object Oriented Design, objects receive messages and reply to them.
In Ruby, sending a message is calling a method and result of that method is the reply.

In Ruby message passing is dynamic. When a message arrives rather than knowing exactly how to reply to it Ruby
uses a predefined set of rules to find a method that can reply to it. We can use these rules to interrupt and reply to
the message, send it to another object or modify it among other actions.
Each time an object receives a message Ruby checks:
1. If this object has a singleton class and it can reply to this message.
2. Looks up this object's class then class' ancestors chain.
3. One by one checks if a method is available on this ancestor and moves up the chain.

=end
class Example
    def example_method
    :example
    end
    def subexample_method
    :example
    end
    def not_missed_method
    :example
    end
    def method_missing name
        return :example if name == :missing_example_method
        return :example if name == :missing_subexample_method
        return :subexample if name == :not_missed_method
        super
    end
end
class SubExample < Example
    def subexample_method
    :subexample
    end
    def method_missing name
        return :subexample if name == :missing_subexample_method
        return :subexample if name == :not_missed_method
        super
    end
end
s = Subexample.new
#To find a suitable method for SubExample#subexample_method Ruby first looks at ancestors chain of SubExample
SubExample.ancestors # => [SubExample, Example, Object, Kernel, BasicObject]

=begin
It starts from SubExample. If we send subexample_method message Ruby chooses the one available one SubExample
and ignores Example#subexample_method.

=end
s.subexample_method # => :subexample
=begin

After SubExample it checks Example. If we send example_method Ruby checks if SubExample can reply to it or not and
since it can't Ruby goes up the chain and looks into Example.
=end
s.example_method # => :example

=begin
After Ruby checks all defined methods then it runs method_missing to see if it can reply or not. If we send
missing_subexample_method Ruby won't be able to find a defined method on SubExample so it moves up to
Example. It can't find a defined method on Example or any other class higher in chain either. Ruby starts over and
runs method_missing. method_missing of SubExample can reply to missing_subexample_method.
=end
s.missing_subexample_method # => :subexample
=begin However if a method is defined Ruby uses defined version even if it is higher in the chain. For example if we send
not_missed_method even though method_missing of SubExample can reply to it Ruby walks up on SubExample
because it doesn't have a defined method with that name and looks into Example which has one.
=end
#s.not_missed_method # => :example