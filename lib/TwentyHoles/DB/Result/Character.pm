use utf8;
package TwentyHoles::DB::Result::Character;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TwentyHoles::DB::Result::Character

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<characters>

=cut

__PACKAGE__->table("characters");

=head1 ACCESSORS

=head2 character_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 character_name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 system_name

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 45

=head2 ship_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 last_seen

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0
  locale: 'en_GB'
  timezone: 'UTC'

=cut

__PACKAGE__->add_columns(
  "character_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "character_name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "system_name",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 45 },
  "ship_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "last_seen",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
    locale => "en_GB",
    timezone => "UTC",
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</character_id>

=back

=cut

__PACKAGE__->set_primary_key("character_id");

=head1 RELATIONS

=head2 system_name

Type: belongs_to

Related object: L<TwentyHoles::DB::Result::System>

=cut

__PACKAGE__->belongs_to(
  "system_name",
  "TwentyHoles::DB::Result::System",
  { name => "system_name" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2014-02-18 21:17:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+zLrrfiTsab8wWROpNy3YQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
