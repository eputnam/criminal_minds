class criminal_minds {
	include 'stdlib'

	$configdir		= "/etc/criminal_minds"
	$configfile		= "team_members=7\nstarting_location=FBI_HQ\ndestination='Philadelphia, PA'"
	$team_data		= parseyaml('/etc/puppetlabs/code/environments/production/modules/criminal_minds/lib/team.yaml')

	notify { "Wheels up in 30!": }

	file { '/etc/testdir':
		ensure 		=> absent,
		force 		=> true,
	}
	file { $configdir :
		ensure 		=> directory,
	}
	file { "${configdir}/criminal_minds.conf":
		ensure 		=> file,
		content 	=> $configfile,
	}
	$team_data.each | $member | {
		criminal_minds::team_member { "${member['member_id']}":
		member_name			=> "${member['member_name']}",
		characteristics		=> "${member['characteristics']}",
		}
	}
}
