# Backups all Bitlocker drives  recovery keys to Active Directory

Required you to have setup the relevent group policy and installed the Bitclocker addins into RSAT.

## Group policy 

Please make sure your computers that you want ot backup keys from have at least the following policy set:

[See this](http://www.alexandreviot.net/2015/06/10/active-directory-how-to-display-bitlocker-recovery-key/)

## Adding Bitlocker tab to ADUC

To be able to retrive keys from ADUC computer objects please make sure to follow the below to install the needed features in to RSAT

[RSAT Bitlocker](;http://www.alexandreviot.net/2015/06/10/active-directory-how-to-display-bitlocker-recovery-key/)

## Running the script

Just right click and choose open with powershell, you will be prompted to elevate and will need to provide credentials of a User with local admin rights.


