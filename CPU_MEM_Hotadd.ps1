Import-Module VMware.VimAutomation.Core
Import-Module VMware.VimAutomation.Storage
Import-Module VMware.VimAutomation.Sdk

Connect-VIServer -Server 10.3.179.166 -User cmbadmin -Password ****


Get-VM -name "MBAI-SHJ*" | Shutdown-VMGuest

$vmview = Get-VM -name "MBAI-SHJ*" | Get-View
$vmConfigSpecMem = New-Object VMware.Vim.VirtualMachineConfigSpec
$extramem = New-Object VMware.Vim.optionvalue
$extramem.Key="mem.hotadd"
$extramem.Value="true"
$vmConfigSpecMem.extraconfig += $extramem
$vmview.ReconfigVM($vmConfigSpecMem)

$vmConfigSpecCPU = New-Object VMware.Vim.VirtualMachineConfigSpec
$extracpu = New-Object VMware.Vim.optionvalue
$extracpu.Key="vcpu.hotadd"
$extracpu.Value="true"
$vmConfigSpecCPU.extraconfig += $extracpu
$vmview.ReconfigVM($vmConfigSpecCPU)

#Ajusting£º
Get-VM -name "ainews-grid1*" | Set-VM -MemoryMB "49152" -NumCpu 16

Get-VM -name "MBAI-SHJ*" | Start-VM

#check
Get-VM -name "FBPOP-SHA*"
Name                 PowerState Num CPUs MemoryGB
----                 ---------- -------- --------
FBPOP-SHA(10.4.0.10) PoweredOn  4        4.000