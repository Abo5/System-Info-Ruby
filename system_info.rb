require 'socket'

def operating_system
  RUBY_PLATFORM
end

def hostname
  Socket.gethostname
end

def cpu_info
  if File.exist?('/proc/cpuinfo')
    cpuinfo = File.read("/proc/cpuinfo")
    cpuinfo.scan(/^model name\s+:\s+(.+)$/).last.first.strip rescue "Unknown"
  else
    "Not available"
  end
end

def memory_info
  if File.exist?('/proc/meminfo')
    meminfo = File.read("/proc/meminfo")
    memtotal = meminfo.match(/^MemTotal:\s+(\d+)/)[1]
    "#{memtotal.to_i / 1024} MB"
  else
    "Not available"
  end
end

def disk_usage
  `df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'`.split("\n")
end

puts "Operating System: #{operating_system}"
puts "Hostname: #{hostname}"
puts "CPU Info: #{cpu_info}"
puts "Memory Info: #{memory_info}"
puts "Disk Usage:"
disk_usage.each do |usage|
  puts "  #{usage}"
end