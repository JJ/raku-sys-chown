use Test;
use Sys::Chown;

my $filename = '01-noroot';
spurt($filename, "'twas brillig and the slithy toves\n");

my $user = ~$*USER;
my $group = ~$*GROUP;
ok chown([$filename], $user, $group ), 'chown worked (no-op)';
ok chown([$filename], $user ), 'chown worked (no-op)';

unlink($filename);
done-testing;
