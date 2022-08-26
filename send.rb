class Hello
    def hello(*args)
        puts 'Hello ' + args.join(' ')
    end
end
h = Hello.new
h.send :hello, 'gentle', 'readers'