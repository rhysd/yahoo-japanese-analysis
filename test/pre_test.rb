path = Dir.pwd+'/../lib'
$LOAD_PATH.push path unless $LOAD_PATH.include? path
raise "You must write your appid to credential.yml ." unless File.exists? "credential.yml"
