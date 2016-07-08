class helloworld {
	notify { "hello world": }
	file { '/etc/testdir':
		ensure => directory,
	}
	file { '/etc/tesdir/helloworld':
		ensure => present
	}
}
