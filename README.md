# ZeroTierOneFixer
This is an intermediate fix for the issue on Windows systems where the Zero Tier One client will not connect to Zero Tier after a system reboot.

## How to Set Up
1. Create a "Scripts" folder in C:\ or a local script location (for example C:\Scripts)
2. Copy ZeroTierFixer.ps1 to the Scripts folder.
3. Create a scheduled task with the following settings:
  - Run as local Administrator (or similar account with local admin privileges)
    - Running as yourself will cause a powershell window to appear every time the job is run.
    - `NT AUTHORITY\SYSTEM` works well personally.
  - Run whether the user is logged on or not
  - Run with highest privileges
  - *Trigger*: At startup, repeat every 5 minutes indefinitely
  - *Actions*: Start a program: powershell.exe
    - Arguments: -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass C:\Scripts\ZeroTierFixer.ps1
  - Save the task
4. Task is ready to go.

## What it does
When Windows starts, the scheduled task will trigger. The script evaluates if the ZeroTier One service is running. If it is not, it will kill the ZeroTier One process which may or may not have started and will wait for 5 seconds. It will then start the ZeroTier One service and wait for 5 seconds. It will then start the ZeroTier One.exe client.

Occasionally, the ZeroTier One task may not start. After 5 minutes, the task will trigger again and since it will see that the ZeroTier One service is started, it will then start the ZeroTier One process.

## My script not perfect?
Feel free to clone and submit a pull request or open an issue.

## Tested with
I tested this on a Windows Server 2016 Standard. I did not test this with Windows 10 1809 which has also been found to have this issue or Windows 7. Please feel free to test on these systems to confirm.
