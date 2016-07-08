class criminal_minds {

	include 'stdlib'

	$configdir		= "/etc/criminal_minds"
	$configfile		= "team_members=7\nstarting_location=FBI_HQ\ndestination='Philadelphia, PA'"
	$team_data		= loadyaml('criminal_minds/lib/team.yaml')
	$transformed_team_data = $team_data.map | $key, $value | { $key => $value }

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
	$transformed_team_data.each | String $member | {
		criminal_minds::team_member { "$member":
		member_name			=> "${member.member_name}",
		characteristics		=> "${member.characteristics}",
		}
	}
}
