#!/usr/bin/perl -w
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'TwentyHoles';

ok( request('/')->is_success, 'Request should succeed' );

done_testing();
