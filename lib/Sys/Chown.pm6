unit module Sys::Chown;

sub chown ( Str:D $user, Str:D $group, @files )is export {

    return CORE::chown($user, $group, @files);

}