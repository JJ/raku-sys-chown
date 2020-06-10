unit module Sys::Chown;

use P5getpwnam;
use P5getgrnam;
use UNIX::Privileges :USER;

subset Valid-User of Str:D where userinfo($_).uid.defined;
subset Valid-Group of Str:D where groupinfo($_).gid.defined;

proto sub chown(|) {*}

multi sub chown ( @files,
                  Valid-User $user,
                  Valid-Group $group = getgrgid(userinfo($user).gid)[0] )
        is export {
    my @result = do for @files -> $f {
        UNIX::Privileges::chown($user, $group, $f);
    }
    so all @result;
}

multi sub chown ( @files,
                  UInt $uid,
                  UInt $gid = userinfo(getpwuid($uid)[0]).gid )
        is export {
    my @result = do for @files -> $f {
        UNIX::Privileges::chown(getpwuid($uid)[0], getgrgid($gid)[0], $f);
    }
    so all @result;
}