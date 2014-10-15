irssi-google-notifier
=====================

Irssi plugin to notify you about hilights and private messages thru google talk


Usage (Ubuntu 14.04) :

Create new Google account which you will use to sent the notifications (ex. yourname.irssi@gmail.com)
Add this new Google account to the contacts of your main account. (The account to which you would like to receive the notifications.)
Install screen, irssi and irssi-xmpp.
```
sudo apt-get install screen irssi irssi-plugin-xmpp
```
Go to ".irssi" folder in your home directory and create folder called "scripts".
Get the notifier plugin.
```
wget https://raw.githubusercontent.com/Belvain/irssi-google-notifier/master/googlenotify.pl
```
Start irssi
Run commands:
```
/load xmpp
/xmppconnect -host talk.google.com google.account.you.just.created@gmail.com yourpassword
```
Now you should be connected to the google talk server, next load the notifier plugin with command
```
/load googlenotify.pl
```
Run command /roster and check the user id string of the account you want to use to RECEIVE the notifications.
Copy that id string for later use.
Run commands:
```
/set googlenotify_receiver theidyoujustcopied
/set googlenotify_sender google.account.you.just.created@gmail.com
```
Reload the plugin with /load googlenotify.pl
Be happy receiving notifications thru your Google account.
