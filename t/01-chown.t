use Test;
use Sys::Chown;
use File::Stat <stat>;

my $filename = %*ENV<GITHUB_ACTIONS> ?? '/home/raku/01-noroot'
        !! '/tmp/01-noroot';
spurt($filename, "'twas brillig and the slithy toves\n");

note "Working with $filename";
my $user = ~$*USER;
my $group = ~$*GROUP;
ok chown([$filename], $user, $group ), 'chown worked (no-op)';
ok chown([$filename], $user ), 'chown worked (no-op)';

ok chown([$filename], +$*USER, +$*GROUP), "Chown with number works (no-op)";
ok chown([$filename], +$*USER), "Chown with number works (no-op)";
ok chown([$filename], +$*USER ~ ":" ~ $*GROUP ),
        "Chown with semicolon works";

ok chown([$filename], $?FILE.IO), "Chown with ref works";


unlink($filename);
done-testing;
