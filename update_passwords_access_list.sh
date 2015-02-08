#! /bin/sh

users="blinkseb aerialls"

for user in $users; do
  knife vault update passwords $user --clean
  knife vault refresh passwords $user
done
