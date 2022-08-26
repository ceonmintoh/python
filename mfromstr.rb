#One way to create a method from raw string data is to use eval to create a Proc from the code:
xml = <<ENDXML
    <methods>
        <method name="go">puts "I'm going!"</method>
    <method name="stop">7*6</method>
</methods>
ENDXML
class Foo
    def self.add_method(name,code)
        body = eval( "Proc.new{ #{code} }" )
        define_method(name,body)
    end
end
require 'nokogiri' # gem install nokogiri

doc = Nokogiri.XML(xml)
    doc.xpath('//method').each do |meth|
        Foo.add_method( meth['name'], meth.text )
    end
f = Foo.new
p Foo.instance_methods(false)   #=> [:go, :stop]
p f.public_methods(false)   #=> [:go, :stop]
f.go    #=> "I'm going!"
p f.stop    #=> 42


