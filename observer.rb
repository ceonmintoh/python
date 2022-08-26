require "observer"

class Moderator
include Observable
    def initialize(name)
        @name = name
    end

    def write
        message = "Computer says: No"
        changed
        notify_observers(message)
    end
end
class Warner
    def initialize(moderator, limit)
        @limit = limit
        moderator.add_observer(self)
    end
end
class Subscriber < Warner
    def update(message)
        puts "#{message}"
    end
end

moderator = Moderator.new("Rupert")
Subscriber.new(moderator, 1)
moderator.write
moderator.write