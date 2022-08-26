#Let's say that we want to be able to test if a number is greater than other number with the syntax
777.is_greater_than_123?.
# open Numeric class
class Numeric
# override `method_missing`
    def method_missing(method_name,*args)
        # test if the method_name matches the syntax we want
        if method_name.to_s.match /^is_greater_than_(\d+)\?$/
        # capture the number in the method_name
        the_other_number = $1.to_i
        # return whether the number is greater than the other number or not
        self > the_other_number
        else
        # if the method_name doesn't match what we want, let the previous definition of `method_missing` handle it
            super
        end
    end
end
#One important thing to remember when using method_missing that one should also override respond_to? method:
class Numeric
    def respond_to?(method_name, include_all = false)
        method_name.to_s.match(/^is_greater_than_(\d+)\?$/) || super
    end
end