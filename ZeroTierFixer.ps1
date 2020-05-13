<#
ZeroTier VPN Service Fixer

Description: This script runs automatically. If "ZeroTier One" service
isn't running, kill "ZeroTier One.exe", start the service, restart
"ZeroTier One.exe"
#>

$ZeroTierOneSvc = Get-Service "ZeroTier One"
$ZeroTierOneExe = "C:\Program Files (x86)\ZeroTier\One\ZeroTier One.exe"
$ZeroTierAlive = Get-Process -Name "ZeroTier One" -ErrorAction SilentlyContinue

if ($ZeroTierOneSvc.Status -ne "Running")
{
    Stop-Process -Name "ZeroTier One"
    Start-Sleep -Seconds 5
    Start-Service "ZeroTier One"
    Start-Sleep -Seconds 5
}



# If 'ZeroTier One.exe' Process is NOT running
if($ZeroTierAlive -eq $null){
    Start-Process $ZeroTierOneExe
}
