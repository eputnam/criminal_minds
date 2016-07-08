class helloworld {
	testdir = "/etc/testdir"

	notify { "hello world": }
	file { testdir :
		ensure => directory,
	}
	file { "#{testdir}/helloworld":
		ensure => file
	}
}
