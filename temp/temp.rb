require 'json'
tempHash = {
    "key_a" => "val_a",
    "key_b" => "val_b"
}
File.open("temp/temp.json","w") do |f|
  f.write(tempHash.to_json)
end