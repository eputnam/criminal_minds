define criminal_minds::team_member(
    $member_id          = $name,
    $member_name        = "mr. default",
    $characteristics    = ["tall", "smart", "funny"],
    ) {
        if ! defined(Class['criminal_minds']) {
            fail('base class must be included!')
        }

        file { "/var/www/${member_id}.html":
            ensure => file,
            content => epp('criminal_minds/team_member.epp', {'member_name' => $member_name, 'characteristics' => $characteristics}),
        }

    }
