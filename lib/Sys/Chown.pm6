unit module Sys::Chown;

use P5getpwnam;
use P5getgrnam;
use UNIX::Privileges :USER;

proto sub chown(|) {*}

multi sub chown ( @files, Str:D $user,
                  Str:D $group = getgrgid(userinfo($user).gid)[0] ) is export {
    my @result = do for @files -> $f {
        UNIX::Privileges::chown($user, $group, $f);
    }
    so all @result;
}

