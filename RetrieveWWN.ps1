Import-Module VMware.VimAutomation.Core
Import-Module VMware.VimAutomation.Storage
Import-Module VMware.VimAutomation.Sdk

Connect-VIServer -Server 10.3.178.33 -User cmbadmin -Password *****

$cluster = Get-Cluster -name "BIZ12-PT01"
$hosti = $cluster | Get-VMHost
$report = foreach ($esxi in $hosti) {
    Get-VMHosthba -VMHost $esxi -type FibreChannel | Where {$_.Status -eq "online"} |
    Select  @{N="Host";E={$esxi.Name}},
        @{N='HBA Node WWNN';E={$wwn = "{0:X}" -f $_.NodeWorldWideName; (0..7 | %{$wwn.Substring($_*2,2)}) -join ':'}},
        @{N='HBA Node WWPN';E={$wwp = "{0:X}" -f $_.PortWorldWideName; (0..7 | %{$wwp.Substring($_*2,2)}) -join ':'}}
}

$report333 | Export-csv  -Path D:\mnx\Scripts\PowerCLI\WWNTECO.csv –NoTypeInformation