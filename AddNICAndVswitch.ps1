Get-VM "Mobile-SH03*" | New-NetworkAdapter -NetworkName "Prod_Network_10.3.137" -Type Vmxnet3 