#------------------------------------------------------------------------------
# Define: pppd::interface
#
#   This define is part of the pppd module.
#   The delegated class is Class['pppd'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-19
#
#------------------------------------------------------------------------------
define pppd::interface (

    $userctl         = undef,
    $bootproto       = undef,
    $name            = undef,
    $device          = undef,
    $type            = undef,
    $onboot          = undef,
    $pidfile         = undef,
    $firewall        = undef,
    $ping            = undef,
    $pppoe_timeout   = undef,
    $lcp_failure     = undef,
    $lcp_interval    = undef,
    $clampmss        = undef,
    $connect_poll    = undef,
    $connect_timeout = undef,
    $defroute        = undef,
    $synchronous     = undef,
    $eth             = undef,
    $provider        = undef,
    $user            = undef,
    $password        = undef,
    $peerdns         = undef,
    $demand          = undef,

) {

    # Collect variables:
    $templates = getvar("${module_name}::params::templates")

    file { "/etc/sysconfig/network-scripts/ifcfg-${title}":
        ensure  => present,
        content => template("${templates}/ifcfg.erb"),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }
}
