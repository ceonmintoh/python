#The with method can be used to seamlessly execute methods on objects:

hash = Hash.new
with hash do
    store :key, :value
    has_key? :key
    values
end