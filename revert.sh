# Currently this file doesn't properly rebind the ttys but I just blindly type my password and I'm back in a graphical session
#!/bin/bash
set -x
  
# Re-Bind GPU to Nvidia Driver
modprobe -r vfio-pci
virsh nodedev-reattach pci_0000_2b_00_1
virsh nodedev-reattach pci_0000_2b_00_0

# Reload nvidia modules
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia

# Rebind VT consoles
#echo 1 > /sys/class/vtconsole/vtcon0/bind
# Some machines might have more than 1 virtual console. Add a line for each corresponding VTConsole
#echo 1 > /sys/class/vtconsole/vtcon1/bind

nvidia-xconfig --query-gpu-info > /dev/null 2>&1
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/bind

# Restart Display Manager
systemctl start nvidia-persistenced.service
systemctl start ly.service
