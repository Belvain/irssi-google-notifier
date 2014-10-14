#!/usr/bin/env perl -w

use strict;
use vars qw($VERSION %IRSSI $NotifyReceiver $NotifySender);

use Irssi;
use utf8;
 
$VERSION = '0.1';
%IRSSI = (
  authors      =>   'Belvain',
  contact      =>   'belvain @ freenode',
  name         =>   'googlenotify',
  description  =>   'Sends out notifications to specified google talk account',
  license      =>   '',
  url          =>   '',

);

Irssi::settings_add_bool($IRSSI{'name'}, 'googlenotify_show_privmsg',   1);
Irssi::settings_add_bool($IRSSI{'name'}, 'googlenotify_show_hilight',   1);
Irssi::settings_add_str($IRSSI{'name'},  'googlenotify_receiver',    'noone');
Irssi::settings_add_str($IRSSI{'name'},  'googlenotify_sender',    'noone');

$NotifyReceiver = Irssi::settings_get_str('googlenotify_receiver');
$NotifySender = Irssi::settings_get_str('googlenotify_sender');

sub sig_message_private ($$$$) {
  return unless Irssi::settings_get_bool('googlenotify_show_privmsg');

  my ($server, $data, $nick, $address) = @_;
  my $body = '(PM: '.$nick.') '.$data;
  my $talkserver = Irssi::server_find_tag('xmpp:'.$NotifySender);
  if (!$talkserver || !$talkserver->{connected}) {
    Irssi::print("Not connected to server");
    return;
  }
  utf8::decode($body);
  $talkserver->send_message($NotifyReceiver, $body, 1)
   
}

sub sig_print_text ($$$) {
  return unless Irssi::settings_get_bool('googlenotify_show_hilight');

  my ($dest, $text, $stripped) = @_;

  if ($dest->{level} & MSGLEVEL_HILIGHT) {
    my $body = '['.$dest->{target}.'] '.$stripped;
    utf8::decode($body);
	my $talkserver = Irssi::server_find_tag('xmpp:'.$NotifySender);
    if (!$talkserver || !$talkserver->{connected}) {
      Irssi::print("Not connected to server");
      return;
    }
    $talkserver->send_message($NotifyReceiver, $body, 1)
  }
}

Irssi::signal_add_last('message private', \&sig_message_private);
Irssi::signal_add_last('print text', \&sig_print_text);

Irssi::print('%G>>%n '.$IRSSI{name}.' '.$VERSION.' loaded');