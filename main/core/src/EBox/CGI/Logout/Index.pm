# Copyright (C) 2004-2007 Warp Networks S.L
# Copyright (C) 2008-2012 Zentyal S.L.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

package EBox::CGI::Logout::Index;

use strict;
use warnings;

use base 'EBox::CGI::ClientBase';
use EBox::Global;
use EBox::Gettext;


sub new # (error=?, msg=?, cgi=?)
{
	my $class = shift;
	my $self = $class->SUPER::new('title' => __('Logout'),
				      'template' => '/logout/index.mas',
				      @_);
	bless($self, $class);
	return $self;
}

sub _process
{
	my $self = shift;
	my $global = EBox::Global->getInstance();
	if ($global->unsaved) {
		my @array = ();
		push(@array, 'unsaved' => 'yes');
		$self->{params} = \@array;
	}
}

sub _loggedIn
{
	return 1;
}


1;
