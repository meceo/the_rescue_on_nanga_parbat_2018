# The Quick&Dirty map with GPS tracking
#### Build to relieve tracking service used for **The Nanga Parbat rescue in 2018**

---

## Story

On Saturday evening, 27th January 2018, the world has experienced the great effort of real heroes Denis Urubko, Adam Bielecki, Jarek Botor, and Piotr Tomala climbing the K2 mountain to rescue Elisabeth Revol and Tomasz Mackiewicz.

One can read more about the rescue story here:
- [Story covered on nationalgeographic.com](https://www.nationalgeographic.com/adventure/article/adam-bielecki-denis-urubko-mountaineers)
- [Story covered on planetmountain.com](https://www.planetmountain.com/en/news/alpinism/the-nanga-parbat-rescue.html)

## The problem

Unfortunately, the rescue team coordinators used the same tracking service (api.findmespot.com) that was publicly available for everyone else. As a consequence of huge traffic and some limits, the service got not responsive and the coordinators appealed to people for not using the service.
- https://twitter.com/mariacywinska/status/957264557084377088- https://twitter.com/barczyk_mateusz/status/957277296666316802

## The quick&dity solution

The project required quickly building and hosting an app to provide the location information of the rescue team and to unload part of the main tracking service traffic.Thanks to [Ruby on Rails](https://rubyonrails.org) framework and [Heroku PAAS](heroku.com) the challenge was fast&easy. In less than an hour, the app was hosted. In a few additional hours, the functionality was delivered.

## Result

The app got linked in many places, including [one of the largest sport website in Poland www.sport.pl](https://www.sport.pl/inne/14,64998,22949860.html). Together with similar apps created by other people, the app helped to relieve the main tracking service a bit.
