class criminal_minds {
        include 'stdlib'

        $configdir              = "/etc/criminal_minds"
        $configfile             = "team_members=7\nstarting_location=FBI_HQ\ndestination='Philadelphia, PA'\n"
        # $team_data              = {
        #         "member" =>
        #                 { "member_id" => "sreid", "member_name" => "Spencer Reid", "characteristics" => ["smart", "awkward", "well-kept"]},
        #         "member2" =>
        #                 { "member_id" => "ahotchner", "member_name" => "Aaron Hotchner", "characteristics" => ["firm", "leader", "compassionate"]},
        #         "member3" =>
        #                 { "member_id" => "dmorgan", "member_name" => "Derek Morgan", "characteristics" => ["hot-headed", "old-fashioned", "alpha"]}
        # }
		$team_data = loadyaml('/etc/puppetlabs/code/environments/production/modules/criminal_minds/lib/team.yaml')

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
                criminal_minds::team_member { $info[member_id] :
                member_name             => $info[member_name],
                characteristics         => $info[characteristics],
                }
        }
}
