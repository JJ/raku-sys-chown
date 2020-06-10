unit module Sys::Chown;

use

sub chown ( Str:D $user, Str:D $group, @files )is export {

    return CORE::chown($user, $group, @files);

}