use Test;
use Sys::Chown;
use File::Stat <stat>;

my $filename = '01-noroot';
spurt($filename, "'twas brillig and the slithy toves\n");

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
