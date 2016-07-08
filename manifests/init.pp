class helloworld {
	notify { "hello world": }
}

directory { '/etc/testdir':
	ensure => directory,
}
