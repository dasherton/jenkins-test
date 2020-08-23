require 'open3'

VERSION_REGEX = %r{\((.*?)\)}.freeze # TODO: Retrieve version without surrounding brackets

def get_version(str)
	matches = str.match(VERSION_REGEX)
	return matches[0].gsub(/[\(\)]/, '')
end

def print_result(result_str, expected, actual)
	puts result_str
	puts "\t Expected: #{expected}"
	puts "\t   Actual: #{actual}"
end

if ARGV.length != 2
	puts "Usage: ruby check_version.rb <executable_path> <expected_hash>"
	exit(1)
end

executable, expected_version = ARGV[0], ARGV[1]

output, status = Open3.capture2("#{executable} version")

actual_version = get_version(output)

if actual_version == expected_version
	print_result("GIT SHA versions match:", expected_version, actual_version)
	exit(0)
else
	print_result("GIT SHA versions do not match:", expected_version, actual_version)
	exit(1)
end
