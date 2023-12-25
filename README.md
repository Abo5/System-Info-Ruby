# System-Info-Ruby
simple Ruby script that collects some basic system information and prints it out. This script gathers information such as the operating system, hostname, available memory, CPU information, and disk usage. To use this script, you would need to have Ruby installed on your computer.

Copy and paste the following code into your editor and save it as `system_info.rb`:

```
#!/usr/bin/env ruby
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
```

Before running the script, make sure that you have the necessary permissions:

```bash
chmod +x system_info.rb
```

Now you can run the script:

```bash
./system_info.rb
```

On non-Unix-based systems (e.g., Windows), the `/proc/` directory used for memory and CPU information does not exist. Therefore, these parts of the script would have to be modified to use platform-specific commands.

Please note that this script is quite basic and might not cover all system information or work on all operating systems. For a more extensive collection of system information or cross-platform compatibility, you may need to use additional or different system calls and/or external gems such as `sys-filesystem` and `sys-cpu`.
