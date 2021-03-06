# GCP project id
project = "suse-css-qa"

# Enable all some pre deployment steps (disabled by default)
pre_deployment = true

# Credentials file for GCP
gcp_credentials_file = "/root/google_credentials.json"

# Region where to deploy the configuration
region = "%REGION%"

# Use an already existing vpc
#vpc_name = "my-vpc"

# Use an already existing subnet in this virtual network
#subnet_name = "my-subnet"

# vpc address range in CIDR notation
# Only used if the vpc is created by terraform or the user doesn't have read permissions in this
# resource. To use the current vpc address range set the value to an empty string
# To define custom ranges
#ip_cidr_range = "10.0.0.0/24"
# Or to use already existing address ranges
#ip_cidr_range = ""
ip_cidr_range = "10.0.0.0/24"

# SSH private key file
private_key_location = "~/.ssh/id_rsa"

# SSH public key file
public_key_location = "~/.ssh/id_rsa.pub"

# SBD related variables
# In order to enable SBD, an ISCSI server is needed as right now is the unique option
# All the clusters will use the same mechanism
# In order to enable the iscsi machine creation sbd_enabled must be set to true for any of the clusters

# iSCSI server address
#iscsi_srv_ip = "10.0.0.253"
# Number of LUN (logical units) to serve with the iscsi server. Each LUN can be used as a unique sbd disk
#iscsi_lun_count = 3
# Disk size in GB used to create the LUNs and partitions to be served by the ISCSI service
#iscsi_disk_size = 10

# Type of VM (vCPUs and RAM)
machine_type = "%MACHINE_TYPE%"

# Disk type for HANA
hana_data_disk_type = "pd-ssd"

# Disk size for HANA in GB
hana_data_disk_size = "834"

# Disk type for HANA backup
hana_backup_disk_type = "pd-standard"

# Disk size for HANA backup in GB
hana_backup_disk_size = "416"

# HANA cluster vip
hana_cluster_vip = "10.0.1.200"

# Enable system replication and HA cluster
hana_ha_enabled = true

# Enable SBD for the hana cluster
#hana_cluster_sbd_enabled = true

# Enable Active/Active HANA setup (read-only access in the secondary instance)
#hana_active_active = true

# The name of the GCP storage bucket in your project that contains the SAP HANA installation files
sap_hana_deployment_bucket = "%HANA_BUCKET%"

# Or you can combine the `sap_hana_deployment_bucket` with `hana_platform_folder` variable.
#sap_hana_deployment_bucket = "MyHanaBucket"
# Specify the path to already extracted HANA platform installation media, relative to sap_hana_deployment_bucket.
# This will have preference over hana archive installation media
#hana_platform_folder = "51053381"

# Or specify the path to the HANA installation archive file in either of SAR, RAR, ZIP, EXE formats, relative to the 'hana_inst_media' mounting point
# For multipart RAR archives, you only need to provide the first part EXE file name.
# If using hana sar archive, please also provide the compatible version of sapcar executable to extract the sar archive
# HANA installation archives be extracted to path specified at hana_extract_dir (optional, by default /sapmedia/HANA)
#hana_archive_file = "IMDB_SERVER.SAR"
#hana_sapcar_exe = "SAPCAR"
#hana_extract_dir = "/sapmedia/HDBSERVER"

# Custom sles4sap image
sles4sap_boot_image = "%SLE_IMAGE%"

# Path to a custom ssh public key to upload to the nodes
# Used for cluster communication for example
cluster_ssh_pub = "salt://sshkeys/cluster.id_rsa.pub"

# Path to a custom ssh private key to upload to the nodes
# Used for cluster communication for example
cluster_ssh_key = "salt://sshkeys/cluster.id_rsa"

# Each host IP address (sequential order).
hana_ips = ["10.0.0.2", "10.0.0.3"]

# Local folder where HANA installation master will be mounted
hana_inst_folder = "/sapmedia/HANA"

# Repository url used to install HA/SAP deployment packages"
# The latest RPM packages can be found at:
# https://download.opensuse.org/repositories/network:/ha-clustering:/Factory/{YOUR OS VERSION}
# Contains the salt formulas rpm packages.
# To auto detect the SLE version
#ha_sap_deployment_repo = "http://download.opensuse.org/repositories/network:/ha-clustering:/Factory/"
# Specific SLE version used in all the created machines
#ha_sap_deployment_repo = "http://download.opensuse.org/repositories/network:/ha-clustering:/Factory/SLE_15/"
ha_sap_deployment_repo = "%HA_SAP_REPO%"

# Optional SUSE Customer Center Registration parameters
#reg_code = "<<REG_CODE>>"
#reg_email = "<<your email>>"
reg_code = "%SCC_REGCODE_SLES4SAP%"

# For any sle12 version the additional module sle-module-adv-systems-management/12/x86_64 is mandatory if reg_code is provided
#reg_additional_modules = {
#    "sle-module-adv-systems-management/12/x86_64" = ""
#    "sle-module-containers/12/x86_64" = ""
#    "sle-ha-geo/12.4/x86_64" = "<<REG_CODE>>"
#}

# Cost optimized scenario
#scenario_type: "cost-optimized"

# To disable the provisioning process
#provisioner = ""

# Run provisioner execution in background
#background = true

# Monitoring variables

# Enable the host to be monitored by exporters
#monitoring_enabled = true

# IP address of the machine where Prometheus and Grafana are running
#monitoring_srv_ip = "10.0.0.4"

# QA variables

# Define if the deployment is using for testing purpose
# Disable all extra packages that do not come from the image
# Except salt-minion (for the moment) and salt formulas
# true or false (default)
#qa_mode = false

# Execute HANA Hardware Configuration Check Tool to bench filesystems
# qa_mode must be set to true for executing hwcct
# true or false (default)
#hwcct = false

# drbd related variables

# Enable drbd cluster
drbd_enabled = true

#drbd_machine_type = n1-standard-4

#drbd_image = suse-byos-cloud/sles-15-sap-byos
drbd_image = "%SLE_IMAGE%"

#drbd_data_disk_size = 15

#drbd_data_disk_type = pd-standard

# Each drbd cluster host IP address (sequential order).
drbd_ips = ["10.0.0.10", "10.0.0.11"]
drbd_cluster_vip = "10.0.1.201"

# Enable SBD for the drbd cluster
#drbd_cluster_sbd_enabled = true

# netweaver related variables

# Enable netweaver cluster
#netweaver_enabled = true

#netweaver_machine_type = n1-standard-4

#netweaver_image = suse-byos-cloud/sles-15-sap-byos

# This storage bucket must contain the next software (select the version you want to install of course)
#SWPM - `IND:SLTOOLSET:2.0:SWPM:*:LINUX_X86_64:*x`
#Netweaver export - `SAP:NETWEAVER:750:DVD_EXPORT:SAP NetWeaver 750 Installation Export DVD 1/1:D51050829_2`
#HANA Platform- `HDB:HANA:2.0:LINUX_X86_64:SAP HANA PLATFORM EDITION 2.0::BD51053787`
#Sapexe folder files:
#igsexe_23-20007790.sar  igshelper_4-10010245.sar  SAPEXE_501-80002573.SAR  SAPEXEDB_501-80002572.SAR  SAPHOSTAGENT45_45-20009394.SAR

#netweaver_software_bucket = "MyNetweaverBucket"

# Netweaver installation required folders
# SAP SWPM installation folder, relative to netweaver_software_bucket folder
#netweaver_swpm_folder     =  "your_swpm"
# Or specify the path to the sapcar executable & SWPM installer sar archive, relative to netweaver_software_bucket folder
# The sar archive will be extracted to path specified at netweaver_extract_dir under SWPM directory (optional, by default /sapmedia/NW/SWPM)
#netweaver_sapcar_exe = "your_sapcar_exe_file_path"
#netweaver_swpm_sar = "your_swpm_sar_file_path"
# Folder where needed SAR executables (sapexe, sapdbexe) are stored, relative to netweaver_software_bucket folder
#netweaver_sapexe_folder   =  "kernel_nw75_sar"
# Additional media archives or folders (added in start_dir.cd), relative to netweaver_software_bucket folder
#netweaver_additional_dvds = ["dvd1", "dvd2"]

#netweaver_ips = ["10.0.0.20", "10.0.0.21", "10.0.0.22", "10.0.0.23"]

#netweaver_virtual_ips = ["10.0.1.25", "10.0.1.26", "10.0.0.27", "10.0.0.28"]

# Enabling this option will create a ASCS/ERS HA available cluster together with a PAS and AAS application servers
# Set to false to only create a ASCS and PAS instances
#netweaver_ha_enabled = true

# Set the Netweaver product id for HA (this is just an example)
#netweaver_product_id = NW750.HDB.ABAPHA
# Fon non HA
#netweaver_product_id = NW750.HDB.ABAP

# Enable SBD for the netweaver cluster
#netweaver_cluster_sbd_enabled = true
