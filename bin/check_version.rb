require 'open3'

def get_version(str)
	matches = str.match(%r{\VERSION (\d.\d.\d)})
	return matches[1]
end

output, status = Open3.capture2("../test.exe version")

version = get_version(output)
expected_version = ARGV[0]

puts "Expected version: #{expected_version}"
puts "Actual version: #{version}"

version == expected_version
