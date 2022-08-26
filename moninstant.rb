#In ruby you can add methods to existing instances of any class.
#This allows you to add behavior to and instance of a
#class without changing the behavior of the rest of the instances of that class.
class Example
    def method1(foo)
    puts foo
    end
end
#defines method2 on object exp
exp = Example.new
exp.define_method(:method2) {puts "Method2"}
#with method parameters
exp.define_method(:method3) {|name| puts name}