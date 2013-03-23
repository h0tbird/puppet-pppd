#------------------------------------------------------------------------------
# Class: pppd::params
#
#   This class is part of the pppd module.
#   You should not be calling this class.
#   The delegated class is Class['pppd'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-01-13
#
#------------------------------------------------------------------------------
class pppd::params {

    # Set location for files and templates:
    $files     = "puppet:///modules/${module_name}/${::operatingsystem}"
    $templates = "${module_name}/${::operatingsystem}"

    # Set OS specifics:
    case $::osfamily {

        'RedHat': {
            $packages = ['ppp','rp-pppoe']
            $configs  = ['/etc/ppp/chap-secrets','/etc/ppp/pap-secrets']
        }

        default: { fail("${module_name}::params ${::osfamily} family is not supported yet.") }
    }
}
