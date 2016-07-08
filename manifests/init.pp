class criminal_minds {

	$testdir		= "/etc/testdir"

	notify { "Wheels up in 30!": }
	file { $testdir :
		ensure => directory,
	}
	file { "${testdir}/helloworld":
		ensure => file
	}
}
