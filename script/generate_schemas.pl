#!/usr/bin/perl -w

use strict;
use warnings;

use Config::JFDI;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

use FindBin;
use lib "$FindBin::Bin/../lib";

my $config_hash = Config::JFDI->open(name => "TwentyHoles", path => "$FindBin::Bin/..")
    or die "Couldn't find config file!";

make_schema_at(
    'TwentyHoles::DB',
    {
        'dump_directory'    => "$FindBin::Bin/../lib",
        'components'        => ['InflateColumn::DateTime'],
        'datetime_timezone' => 'UTC',
        'datetime_locale'   => 'en_GB',
    },
    $config_hash->{'Model::DB'}->{'connect_info'},
);
