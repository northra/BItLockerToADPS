# Backup BitLocker recovery keys to Active Directory
# Stephen Martin <sudormminusrf@gmail.com>
#
# Windows 8 and above, Powershell 4 and above required.
# You are required to have local admin rights to be able to use this script.

# Correct group policy to allow saving keys to ADDS http://windowsitpro.com/windows-8/group-policy-settings-bitlocker
# Add BitLocker tab to ADUC http://www.alexandreviot.net/2015/06/10/active-directory-how-to-display-bitlocker-recovery-key/

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


Get-BitLockerVolume | Where-Object {$_.ProtectionStatus -eq "On"} | foreach {
    Write-output "[+] Backing up $_"
    Write-Output ""
    $idfull = manage-bde -protectors -get $_.MountPoint -t RecoveryPassword | Select-String ID
    $id = $idfull.toString().split(' ')[-1].Trim()
    Manage-BDE.exe -protectors -adbackup $_.MountPoint -ID $id
}

pause
