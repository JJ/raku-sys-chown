# Sys::Chown

A port of [Perl's File::Chown](https://github.com/perlancar/perl-File-chown
) to Raku, using [Lizmat's Butterfly project](https://modules.raku.org/dist/P5built-ins:cpan:ELIZABETH)

## Installing

The usual

    zef install Sys::Chown

## Running


```perl6
use Sys::Chown;
#Taken verbatim from File::Chown

# chown by user-/group names
chown "ujang", "ujang", @files;
# numeric ID's still work
chown -1, 500, "myfile.txt";
# option: use a reference file's owner/group instead of specifying directly,
# like the Unix chown command's --reference=FILE.
chown({ref => "/etc/passwd"}, "mypasswd");
```


## License

Licensed under the Artistic 2.0 License (the same as Raku itself).
