# Determine's if the Vagrant VMWare Fusion plugin is installed, and enables it
# by default if it is available
FUSION_PLUGIN_INSTALLED=1

which vagrant &>/dev/null
if [[ $? -eq 0 ]]; then
  vagrant plugin list | grep -q vagrant-vmware-fusion
  FUSION_PLUGIN_INSTALLED=$?
fi

if [[ $FUSION_PLUGIN_INSTALLED -eq 0 ]]; then
    export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
    export VAGRANT_VMWARE_CLONE_DIRECTORY=${HOME}/.vagrant.d/projects

    # keep vagrant VMs in standard place to make Time Machine less cranky
    if [ ! -d ${VAGRANT_VMWARE_CLONE_DIRECTORY} ]; then
        mkdir -p ${VAGRANT_VMWARE_CLONE_DIRECTORY}
    fi
fi
