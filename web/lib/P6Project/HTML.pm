package P6Project::HTML;

use strict;
use warnings;
use 5.010;

use HTML::Template;
use Time::Piece;
use Time::Seconds;

sub new {
  my ($class, %opts) = @_;
  my $self = \%opts;
  return bless $self, $class;
}

sub p6p {
  my ($self) = @_;
  return $self->{p6p};
}

sub get_html {
  my ($self, $projects) = @_;
  my $li;
  my $template = HTML::Template->new(
    filename           => $self->p6p->template,
    die_on_bad_params  => 0,
    default_escape     => 'html',
  );

  $template->param(projects => $projects);
  my $last_update = gmtime()->strftime('%Y-%m-%d %H:%M:%S GMT');
  $template->param(last_update => $last_update);
  $template->param(total => scalar @$projects);

  return $template->output;
}

1;
