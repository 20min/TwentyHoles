use utf8;
package TwentyHoles::DB::Result::System;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TwentyHoles::DB::Result::System

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

=head1 TABLE: C<systems>

=cut

__PACKAGE__->table("systems");

=head1 ACCESSORS

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->set_primary_key("name");

=head1 RELATIONS

=head2 characters

Type: has_many

Related object: L<TwentyHoles::DB::Result::Character>

=cut

__PACKAGE__->has_many(
  "characters",
  "TwentyHoles::DB::Result::Character",
  { "foreign.system_name" => "self.name" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2014-02-17 21:26:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n94yt5wKf56N8jupceeqow


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
