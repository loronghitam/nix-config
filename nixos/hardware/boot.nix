{ pkgs, ... }:
{
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelPackages = pkgs.linuxPackages_5_15;
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_5_15.rtw89 ];
}
