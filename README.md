irssi-google-notifier
=====================

Irssi plugin to notify you about hilights and private messages thru google talk


Usage (Ubuntu 14.04) :

1. Create new Google account which you will use to sent the notifications (ex. yourname.irssi@gmail.com)
2. Add this new Google account to the contacts of your main account. (The account to which you would like to receive the notifications.)
3. Install screen, irssi and irssi-xmpp.
```
sudo apt-get install screen irssi irssi-plugin-xmpp
```
4. Go to ".irssi" folder in your home directory and create folder called "scripts".
5. Get the notifier plugin.
```
wget https://raw.githubusercontent.com/Belvain/irssi-google-notifier/master/googlenotify.pl
```
6. Start irssi
7. Run commands:
```
/load xmpp
/xmppconnect -host talk.google.com google.account.you.just.created@gmail.com yourpassword
```
8. Now you should be connected to the google talk server, next load the notifier plugin with command
```
/load googlenotify.pl
```
9. Run command /roster and check the user id string of the account you want to user to RECEIVE the notifications.
10. Copy that id string for later use.
11. Run commands:
```
/set googlenotify_receiver theidyoujustcopied
/set googlenotify_sender google.account.you.just.created@gmail.com
```
12. Reload the plugin with /load googlenotify.pl
13. Be happy receiving notifications thru your Google account.
