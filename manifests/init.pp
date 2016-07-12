class criminal_minds {
        include 'stdlib'
	
	$docroot 		= "/var/www"
        $configdir              = "/etc/criminal_minds"
        $configfile             = "team_members=7\nstarting_location=FBI_HQ\ndestination='Philadelphia, PA'\n"
	$team_data 		= loadyaml("/etc/puppetlabs/code/environments/production/modules/criminal_minds/lib/team.yml")

        notify { "Wheels up in 30!": }

        file { '/etc/testdir':
                ensure          => absent,
                force           => true,
        }
        file { $configdir :
                ensure          => directory,
        }
        file { "${configdir}/criminal_minds.conf":
                ensure          => file,
                content         => $configfile,
        }

        file { "${docroot}/index.html":
                ensure          => file,
                content         => epp("criminal_minds/index.epp",{ "team_members" => $team_data })
        }

        $team_data.each | $member, $info | {
                criminal_minds::team_member { $member :
                member_name             => $info[member_name],
                characteristics         => $info[characteristics],
                }
        }
}
