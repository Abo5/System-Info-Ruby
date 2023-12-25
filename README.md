# System-Info-Ruby
simple Ruby script that collects some basic system information and prints it out. This script gathers information such as the operating system, hostname, available memory, CPU information, and disk usage. To use this script, you would need to have Ruby installed on your computer.

Copy and paste the following code into your editor and save it as `system_info.rb`Before running the script, make sure that you have the necessary permissions:
```
chmod +x system_info.rb
```
Now you can run the script:
```
./system_info.rb
```
On non-Unix-based systems (e.g., Windows), the `/proc/` directory used for memory and CPU information does not exist. Therefore, these parts of the script would have to be modified to use platform-specific commands.

Please note that this script is quite basic and might not cover all system information or work on all operating systems. For a more extensive collection of system information or cross-platform compatibility, you may need to use additional or different system calls and/or external gems such as `sys-filesystem` and `sys-cpu`
