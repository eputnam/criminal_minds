define criminal_minds::team_member(
    $member_name        = "mr. default",
    $characteristics    = ["tall", "smart", "funny"],
    ) {
        if ! defined(Class['criminal_minds']) {
            fail('base class must be included!')
        }

        file { '/var/www/${member_name}.html':
            ensure => file,
            content => template('templates/team_member.erb', {'member_name' => $member_name, 'characteristics' => $characteristics}),
        }

    }
