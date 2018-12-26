# Step 1: Create a new resource group and key vault in the same location.
    # Fill in 'MyLocation', 'MySecureRG', and 'MySecureVault' with your values.
    # Use Get-AzureRmLocation to get available locations and use the DisplayName.
    # To use an existing resource group, comment out the line for New-AzureRmResourceGroup
## Connecting to Azure ##
#Connect-azaccount
## Select the Azure Subscription ##
#Select-AzSubscription -Subscription Sandpits
## Step 1:  Create KeyVault
    $Loc = 'westeurope';
    $rgname = 'cloudopslab-rg';
    $KeyVaultName = 'Dev-VM-DiskVault';
    #New-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname -Location $Loc;
    $KeyVault = Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname;
    write-host "New KeyVault created" $KeyVault
    $KeyVaultResourceId = (Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname).ResourceId;
    write-host "KeyVaultResourceId-" $KeyVaultResourceId
    $diskEncryptionKeyVaultUrl = (Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname).VaultUri;
    write-host $diskEncryptionKeyVaultUrl
#Step 2: Enable the vault for disk encryption.
    Set-AzureRmKeyVaultAccessPolicy -VaultName $KeyVaultName -ResourceGroupName $rgname -EnabledForDiskEncryption;

# #Step 3: Create a new key in the key vault with the Add-AzureKeyVaultKey cmdlet.
#     # Fill in 'MyKeyEncryptionKey' with your value.
#
    $keyEncryptionKeyName = 'uQjhcJ3eVc';
    Add-AzureKeyVaultKey -VaultName $KeyVaultName -Name $keyEncryptionKeyName -Destination 'Software';
    $keyEncryptionKeyUrl = (Get-AzureKeyVaultKey -VaultName $KeyVaultName -Name $keyEncryptionKeyName).Key.kid;
    write-host  "New keyEncryptionKeyUrl" $keyEncryptionKeyUrl
    write-host "DiskEncryptionKeyVaultUrl" $diskEncryptionKeyVaultUrl
    write-host "KeyVaultResourceId-" $KeyVaultResourceId

# #Step 4: Encrypt the disks of an existing IaaS VM
#     # Fill in 'MySecureVM' with your value.
#
      $VMName = 'devwin01';
      Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $rgname -VMName $vmName -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -KeyEncryptionKeyUrl $keyEncryptionKeyUrl -KeyEncryptionKeyVaultId $KeyVaultResourceId;

      ## adding the Backup managment to Valut Access policies.DESCRIPTION
      ## https://stackoverflow.com/questions/46094914/adding-the-backup-management-service-to-keyvault-in-azure-powershell
