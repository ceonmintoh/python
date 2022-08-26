#Any String can be evaluated at runtime.
class Example
    def self.foo
    :foo
    end
end
eval "Example.foo" #=> :foo