#------------------------------------------------------------------------------
# Class: pppd::config
#
#   This class is part of the pppd module.
#   You should not be calling this class.
#   The delegated class is Class['pppd'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-01-13
#
#------------------------------------------------------------------------------
class pppd::config {

    # Collect variables:
    $templates = getvar("${module_name}::params::templates")
    $configs   = getvar("${module_name}::params::configs")
    $ifaces    = getvar("${module_name}::ifaces")

    # Define the target files:
    concat { $configs:
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
    }

    # Config file headers:
    concat::fragment {
        'chap_header':
            ensure  => present,
            target  => $configs[0],
            content => template("${templates}/chap-secrets_header.erb"),
            order   => '00';
        'pap_header':
            ensure  => present,
            target  => $configs[1],
            content => template("${templates}/pap-secrets_header.erb"),
            order   => '00';
    }

    # Interfaces:
    create_resources(pppd::interface, $ifaces)
}
