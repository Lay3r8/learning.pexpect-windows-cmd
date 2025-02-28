"""
Test Pexpect. Powershell script is not working. It is not capturing the output.
"""
import sys
from typing import Final
from pexpect import popen_spawn, EOF

# Define command
COMMAND: Final = r"cmd.exe /c C:\Users\azureuser\VSCodeProjects\soft-hr-scheduler\test\test.bat"
# COMMAND: Final = r"powershell.exe C:\Users\azureuser\VSCodeProjects\soft-hr-scheduler\test\test.ps1"

# Start the process
child = popen_spawn.PopenSpawn(
    COMMAND,
    logfile = sys.stdout.buffer
)

# Capture the output
child.expect("Please enter your name:", timeout=5)
child.sendline("Bob")
child.expect(EOF)
