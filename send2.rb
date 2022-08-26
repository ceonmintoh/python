class Account
    attr_accessor :name, :email, :notes, :address
    def assign_values(values)
        values.each_key do |k, v|
            # How send method would look a like
            # self.name = value[k]
            self.send("#{k}=", values[k])
        end
    end
end
user_info = {
name: 'Matt',
email: 'test@gms.com',
address: '132 random st.',
notes: "annoying customer"
}
account = Account.new
#If attributes gets increase then we would messup the code
#--------- Bad way --------------
account.name = user_info[:name]
account.address = user_info[:address]
account.email = user_info[:email]
account.notes = user_info[:notes]
# --------- Meta Programing way --------------
account.assign_values(user_info) 
# With single line we can assign n number of attributes
puts account.inspect