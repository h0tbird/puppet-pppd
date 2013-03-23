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

    create_resources(pppd::interface, $ifaces)
}
