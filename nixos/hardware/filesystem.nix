{
  fileSystems = {
    "/" =
      {
        device = "/dev/disk/by-uuid/cbe04151-e6f1-4598-a9c4-019953218696";
        fsType = "ext4";
      };
    "/boot" =
      {
        device = "/dev/disk/by-uuid/84D5-312C";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };
    "/home" =
      {
        device = "/dev/disk/by-uuid/5afcf2f4-72b3-4240-b23a-97804f113f8a";
        fsType = "ext4";
      };
  };
}
