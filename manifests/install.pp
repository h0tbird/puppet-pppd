#------------------------------------------------------------------------------
# Class: pppd::install
#
#   This class is part of the pppd module.
#   You should not be calling this class.
#   The delegated class is Class['pppd'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-01-13
#
#------------------------------------------------------------------------------
class pppd::install {

    # Collect variables:
    $version  = getvar("${module_name}::version")
    $packages = getvar("${module_name}::params::packages")

    # Install the package/s:
    package { $packages: ensure => $version }
}
