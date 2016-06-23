# Backup BitLocker recovery keys to Active Directory
# Stephen Martin <sudormminusrf@gmail.com>

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


Get-BitLockerVolume | Where-Object {$_.ProtectionStatus -eq "On"} | foreach {
    Write-output "[+] Backing up $_"
    Write-Output ""
    $idfull = manage-bde -protectors -get $_.MountPoint -t RecoveryPassword | Select-String ID
    $id = $idfull.toString().split(' ')[-1].Trim()
    Manage-BDE.exe -protectors -adbackup $_.MountPoint -ID $id
}

pause
