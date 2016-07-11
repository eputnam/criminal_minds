class criminal_minds {
	include 'stdlib'

	$configdir		= "/etc/criminal_minds"
	$configfile		= "team_members=7\nstarting_location=FBI_HQ\ndestination='Philadelphia, PA'\n"
	$docroot		= "/var/www"
	$team_data		= {
		"member" =>
			{ "member_id" => "sreid", "member_name" => "Spencer Reid", "characteristics" => ["smart", "awkward", "well-kept"]},
		"member" =>
			{ "member_id" => "ahotchner", "member_name" => "Aaron Hotchner", "characteristics" => ["firm", "leader", "compassionate"]},
		"member" =>
			{ "member_id" => "dmorgan", "member_name" => "Derek Morgan", "characteristics" => ["hot-headed", "old-fashioned", "alpha"]}
	}

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

	file { "${docroot}/index.html":
		ensure 		=> file,
		content		=> epp("criminal_minds/index.epp",{ "team_members" => $team_data })
	}

	$team_data.each | $member | {
		criminal_minds::team_member { $member.member_id :
		member_name			=> $member.member_name,
		characteristics		=> $member.characteristics,
		}
	}
}
