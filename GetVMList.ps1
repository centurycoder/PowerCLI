Import-Module VMware.VimAutomation.Core
Import-Module VMware.VimAutomation.Storage
Import-Module VMware.VimAutomation.Sdk

Connect-VIServer -Server 10.3.178.34
Connect-VIServer -Server 10.3.179.166 -User cmbadmin -Password ****

#��ȡIP������������ע��
get-Cluster "NBDMZ-VSAN01" | Get-VM | select @{N='VMName';E={$_.Name}}, @{N='AppName';E={$_.CustomFields.Item("ϵͳ����")}}, @{N='IP';E={$_.guest.IPAddress[0]}}, @{N='HostName';E={$_.guest.HostName}} | export-csv D:\mnx\Scripts\PowerCLI\out.csv -encoding "unicode" -notype

#��ȡVMName��IP�����������Ͳ���ϵͳ����
get-Cluster "NBDMZ" | Get-VM | select @{N='VMName';E={$_.Name}},@{N='IP';E={$_.guest.IPAddress[0]}}, @{N='HostName';E={$_.guest.HostName}}, @{N='OSVersion';E={$_.guest.OSFullName}} | export-csv D:\mnx\Scripts\PowerCLI\out.csv -encoding "unicode" -notype

get-Cluster "NBDMZ" | Get-VM | select Name



#work area:
get-Cluster "NBDMZ-VSAN01" | Get-VM | select @{N='VMName';E={$_.Name}},@{N='IP';E={$_.guest.IPAddress[0]}}, @{N='HostName';E={$_.guest.HostName}}, @{N='OSVersion';E={$_.guest.OSFullName}} | export-csv D:\mnx\Scripts\PowerCLI\out.csv -encoding "unicode" -notype