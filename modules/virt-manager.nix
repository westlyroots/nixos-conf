{...}:{
programs.virt-manager.enable = true;

users.groups.libvirtd.members = ["westlyroots"];

virtualisation.libvirtd.enable = true;

virtualisation.spiceUSBRedirection.enable = true;
}
