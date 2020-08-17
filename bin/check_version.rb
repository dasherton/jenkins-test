require 'open3'

def get_version(str)
	matches = str.match(%r{\VERSION (\d.\d.\d)})
	return matches[1]
end

executable, expected_version = ARGV[0], ARGV[1]

output, status = Open3.capture2("#{executable} version")

version = get_version(output)

puts "Expected version: #{expected_version}"
puts "Actual version: #{version}"

return_value = (version == expected_version)
exit(return_value)
