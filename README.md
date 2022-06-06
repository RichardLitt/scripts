# Scripts

This is a catch-all repository I use for various scripts that I use locally and which are generally included in my path. Not everything here is related to everything else.

### `emailFriends.py`

This is a cool script that emails me a new friend every day who I could get in touch with.

To make it work, rename and move `local.richard.friends.plist` to your `/Library/LaunchDaemons` on a mac. From there, use `launchctl` to get it up and running every day.

```
sudo launchctl start /Library/LaunchDaemons/local.richard.friends.plist
```

You'll need to have it access various folders if you look at the .plist file:

```xml
<array>
  <string>/Library/Frameworks/Python.framework/Versions/3.7/bin/python3</string>
  <string>/Users/richard/docs/friends/emailFriends.py</string>
  <string>/Users/richard/docs/friends/friends-list.md</string>
</array>
```

I use a separate folder called `friends/`, where I keep the python file, and a list of friends who I want the script to cycle through, and the log folder for errors. Create this folder wherever makes sense to you, and add in a newline-delimited file with a list of friends you want to be emailed to you. 

You can edit the template email by editing `emailFriends.py`. It's not the best or most intuitive system at the moment, but it works pretty well for me.

### `emailNeeds.py`

Very similar to the above, and this also uses the `hotspots.plist` file, but it emails me a list of [eBird](https://ebird.org) hotspots which need to be a birded on a given day in a two mile radius of my house. Unlikely to be useful to others.

### `vermont251`

This helps me manage and import new checklists from the [251 Project](https://birdinginvermont.com/251) on BirdingInVermont.com

### `vesper_open.sh`

This helps me manage my nocturnal flight call recordings using [Vesper](https://github.com/HaroldMills/Vesper).

### ebird-hotspots/

This is used to send me an email every day with eBird hotspots I should go walk to and log birds in.