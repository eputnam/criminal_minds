class criminal_minds {

	$configdir		= "/etc/criminal_minds"
	$configfile		= "team_members=7\nstarting_location=FBI_HQ\ndestination='Philadelphia, PA'"

	notify { "Wheels up in 30!": }

	file { '/etc/testdir':
		ensure => absent
	}
	file { $configdir :
		ensure => directory,
	}
	file { "${configdir}/criminal_minds.conf":
		ensure => file
		content => $configfile
	}
}
