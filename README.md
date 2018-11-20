# PowerCLI
Useful powercli scripts to automate daily operations with vmware vsphere.

AddNICAndVswitch.ps1 - Add a NIC for a VM and attach it to specified vswitch
CPU_MEM_Hotadd.ps1	 - Turn on hot-add feature for a VM, and after that, ajust CPU/MEM configuration, and finally verify the change has take effect.
RetrieveWWN.ps1		 - Retrive HBA WWN and WWPN for all esx hosts in a cluster, usefull for mapping LUN on storage side.
GetVMList.ps1		 - Get all VMs with some useful attributes in a cluster