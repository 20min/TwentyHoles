use utf8;
package TwentyHoles::DB::ResultSet::Character;
use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

use DateTime;

sub seen_character {
    my $self = shift;
    my $opts = shift;

    my $now = DateTime->now(); #UTC by default

    my $character = $self->find_or_new({
        'character_id' => $opts->{'character_id'},
    });
    $character->character_name( $opts->{'character_name'} );
    $character->ship_name( $opts->{'ship_name'} );
    $character->last_seen( $now );
    my $system = $self->related_resultset('system_name')->find_or_new({
        'name' => $opts->{'system_name'},
    });
    $character->system_name( $system );
    $character->update_or_insert;
}
1;