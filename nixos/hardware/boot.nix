{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    # Penambahan inputan untuk wifi yang sering diskonek https://github.com/lwfinger/rtw89?tab=readme-ov-file#option-configuration
    extraModprobeConfig = ''
      options rtw89_pci disable_clkreq=y disable_aspm_l1=y disable_aspm_l1ss=y
      options rtw89pci disable_clkreq=y disable_aspm_l1=y disable_aspm_l1ss=y
      options rtw89_core disable_ps_mode=y
      options rtw89core disable_ps_mode=y
    '';
  };
}
