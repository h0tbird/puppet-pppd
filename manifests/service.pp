#------------------------------------------------------------------------------
# Class: pppd::service
#
#   This class is part of the pppd module.
#   You should not be calling this class.
#   The delegated class is Class['pppd'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-01-13
#
#------------------------------------------------------------------------------
class pppd::service {

    # Collect variables:
    $ensure   = getvar("${module_name}::ensure")
    $services = getvar("${module_name}::params::services")

    # Start or stop the service:
    service { $services:
        ensure  => $ensure,
        enable  => $ensure ? {
            'running' => true,
            'stopped' => false,
        }
    }
}
