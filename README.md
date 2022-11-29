# Sys::Chown [![Test distro](https://github.com/JJ/raku-sys-chown/actions/workflows/test.yaml/badge.svg)](https://github.com/JJ/raku-sys-chown/actions/workflows/test.yaml)

A port of [Perl's File::Chown](https://github.com/perlancar/perl-File-chown
) to Raku, using [Lizmat's Butterfly project](https://modules.raku.org/dist/P5built-ins:cpan:ELIZABETH)

## Installing

The usual

    zef install Sys::Chown

## Running


```perl6
use Sys::Chown;

# chown by user-/group names
chown <foo bar baz>, "ujang", "ujang";
# numeric ID's still work
chown ["myfile.txt"], -1, 500;
# option: use a reference file's owner/group instead of specifying directly,
# like the Unix chown command's --reference=FILE.
chown(["mypasswd"], {ref => "/etc/passwd"} );

chown(<foo bar>, "1001:1001");

```


## License

Licensed under the Artistic 2.0 License (the same as Raku itself).
