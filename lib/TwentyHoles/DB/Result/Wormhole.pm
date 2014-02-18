use utf8;
package TwentyHoles::DB::Result::Wormhole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TwentyHoles::DB::Result::Wormhole

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

=head1 TABLE: C<wormholes>

=cut

__PACKAGE__->table("wormholes");

=head1 ACCESSORS

=head2 start_system

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 45

=head2 end_system

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "start_system",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 45 },
  "end_system",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</start_system>

=item * L</end_system>

=back

=cut

__PACKAGE__->set_primary_key("start_system", "end_system");

=head1 RELATIONS

=head2 end_system

Type: belongs_to

Related object: L<TwentyHoles::DB::Result::System>

=cut

__PACKAGE__->belongs_to(
  "end_system",
  "TwentyHoles::DB::Result::System",
  { name => "end_system" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 start_system

Type: belongs_to

Related object: L<TwentyHoles::DB::Result::System>

=cut

__PACKAGE__->belongs_to(
  "start_system",
  "TwentyHoles::DB::Result::System",
  { name => "start_system" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2014-02-17 22:23:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2mxjTCQY5e5bHXRh5IGnzQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
