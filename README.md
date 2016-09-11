# TWDLT docker container

[![](https://images.microbadger.com/badges/version/rootlogin/twdlt.svg)](http://microbadger.com/images/rootlogin/twdlt "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/rootlogin/twdlt.svg)](http://microbadger.com/images/rootlogin/twdlt "Get your own image badge on microbadger.com")

This is a docker-ed version of [YoSmudge/twdlt](https://github.com/YoSmudge/twdlt).

* Base-system: Alpine Linux 3.4
* Base-image: [rootlogin/python2](https://hub.docker.com/r/rootlogin/python2/)

TWDLT is a simple Python script to automatically delete any tweets older than a certain date. You can set separate "expire" times for normal tweets and @replies.

## Usage

### With docker-compose (Prefered way)

```bash
# Create a directory
$ mkdir twdlt && cd twdlt
# Download docker-compose file
$ wget https://github.com/chrootLogin/docker-twdlt/raw/master/docker-compose.yml.dist -O docker-compose.yml
# Change the setting to your needs
$ vi docker-compose.yml
# Start twdlt
$ docker-compose up -d
```

### Without docker-compose

```bash
$ docker run -d \
  --name twdlt \
  -e AGE=240 \
  -e AT_AGE=240 \
  -e CONSUMER_KEY=xxxx \
  -e CONSUMER_SECRET=xxxx \
  -e ACCESS_TOKEN=xxxx \
  -e ACCESS_SECRET=xxxx \
  rootlogin/twdlt
```

## Configuration

Twdlt is setup through environment variables:

* **AGE** - *default: 24* - tweets will be deleted after this many hours
* **AT_AGE** - *default: 24* - @replies will be deleted after this many hours.
* **PER_PAGE** - *default: 150* - number of tweets fetched per page*
* **MAX_PAGE** - *default: 5* - maximum number of pages to fetch*
* **USE_LIMIT** - *default: 0.25* - maximum % of rate limit for a resource that will be used
* **EVERY** - *default: 60* - how often to check for tweets to delete, in minutes.
* **EXCLUDE** - List of Python formatted Regex's, any tweets that match any regex will use `atAge` instead of `age`

*Twitter-API setting*

* **CONSUMER_KEY**
* **CONSUMER_SECRET**
* **ACCESS_TOKEN**
* **ACCESS_SECRET**

#Licence

This software is licensed under the GPLv3.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
