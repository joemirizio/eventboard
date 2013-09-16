# EventBoard
###A dashboard application for events!

EventBoard allows users to create polls for their events. Users have the ability to create an event with a name and description. They can then create as many polls and choices as their heart desires. Event attendees can then search for the event and vote in the created polls. The polls for every event are displayed in a carousel, which is ideal for displaying on TVs and monitors throughout the venue.

This application is written in Ruby on Rails and is a demonstration of the powerful MVC features Rails has to offer.

Other features include:
* Unique flat design
* Responsive display via [Bootstrap 3](http://getbootstrap.com/) and CSS media queries
* Beautiful charts via [Chart.js](http://www.chartjs.org/)

###REST API
Show all events
```
GET /events.{xml,json}
```

Show event details
```
GET /events/[event_id].{xml,json}
```

Show poll details
```
GET /polls/[poll_id].{xml,json}
```

This software is released under the MIT License
