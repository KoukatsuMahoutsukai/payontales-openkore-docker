# Payontales-Openkore-docker
Dockerfile of an image of openkore for payontales.
wont work out of the box for other servers!

image on dockerhub https://hub.docker.com/r/koukatsumahoutsukai/payontales-openkore

Simple prebuilt openkore for payontales. run docker and directly login with username/pass (no env variables here!!)
the openkore was downloaded directly from the servers website https://payontales.com/


ideally do a `docker run -d` and `docker attach` to it later on if you plan to run multiple openkores. ctrl+p + ctrl+q to detach.


you can modify the dockerfile to download the official openkore if you are going to use it for another server etc but there are already other docker images for that.
