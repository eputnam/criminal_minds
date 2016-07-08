class helloworld {
	notify { "hello world": }
}

file { '/etc/testdir':
	ensure => directory,
}
