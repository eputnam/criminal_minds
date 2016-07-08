class criminal_minds {
	notify { "Wheels up in 30!": }
	file { '/etc/testdir':
		ensure => directory,
	}
	file { '/etc/testdir/helloworld':
		ensure => file
	}
}
