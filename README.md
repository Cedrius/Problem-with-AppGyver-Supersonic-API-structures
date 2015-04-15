# Problem-with-AppGyver-Supersonic-API-structures
just adding an API into supersonic appgyver steroids

Ok, after a couple weeks of trying to get this working and although, I still haven't been able to get this to work yet.. I think I'm getting somewhere with this FINALLY… It seems the biggest problem here is using Kimono and AppGyver. The JSON file has been updated in Kimono using:

function transform(data) {
  data.results.collection1 = data.results.collection1.map(function(o) {
    o.eventdescription = {
      text: o.eventdescription
    }
    return o;
  });
  return data;
}

This cleans up the JSON file exported/ coming in as API to App Gyver so that all parts are objects. ( I know, maybe not a big deal, but I just wanted to make this as clean as possible). To give you an idea of the before and after of using this script in the Kimono Modify Results box —> BEFORE:

"EventTitles": {
"href": "http://",
"src": "http://.jpg",
"text": "Lorem Ipsum"
},
"HeadlineImages": {
"href": "http://",
"src": "http://.jpg",
"text": "Lorem Ipsum"
},
"eventdescription":"Lorem Ipsum" 
},

which leaves eventdescription as a string rather than object and then the AFTER:

"EventTitles": {
"href": "http://",
"src": "http://.jpg",
"text": "TEXT"
},
"HeadlineImages": {
"href": "http://",
"src": "http://.jpg",
"text": "TEXT"
},
"eventdescription": {
"text": "TEXT"
},

So, after running this into Kimono as you can see all entries are “objects”. And you'd use &kimmodify=1 AFTER the apikey in the link thusly:

https://www.kimonolabs.com/api/{indentifier}{apikey}&kimmodify=1

NEXT, as I was explained to by the AppGyver community one would pretty much need an “id” of sorts for each item in the JSON / API that's being created to be able to use the ShowController to create a reasonable/ feasible url string on the show.html.

Which should create something like /app/tier/showid=123456789 when going from the index to a specific entry view.

(You find the URLs by using the debug mode in AppGyver either via Safari Web Inspector on Mac with the IOS Emulator. or a browser using localhost:[some port number]/location/of/app when using the Android Emulator (the recommended Genymotion).

So, to do this, in Kimono use the API Hash addition &kimhash=1 to the end of your url AFTER the APIKEY but BEFORE the modify such as this:

https://www.kimonolabs.com/api/{indentifier}{apikey}&kimhash=1&kimmodify=1

. See: Kimono API Docs- Re:Hash.

This creates something like

"EventTitles": {
"href": "http://",
"src": "http://.jpg",
"text": "TEXT"
},
"HeadlineImages": {
"href": "http://",
"src": "http://.jpg",
"text": "TEXT"
},
"eventdescription": {
"text": "TEXT"
}, 
"hash":"1a2b3c4d5e6f7g8h9z"},

a random ‘indentifier’ is created for each entry.

Now, that's where I'm stuck now. …because the API URL needing to come in is:

https://www.kimonolabs.com/api/{indentifier}{apikey}&kimhash=1&kimmodify=1

and when you go to configure your API on the backend there is no area I see to enter this new &kimhash=1&kimmodify=1 that needs to be at the end of the URL to call in the correctly formatted and id'd API and as far as I can see there is no reference for doing this.

http://docs.appgyver.com/supersonic/guides/data/other-data-providers/kimono-labs/

I feel like this is the next to last step in figuring this all out and finally being able to get this up and working. The last being to obviously revisit pulling in the id to the ShowController which I'm feeling somewhat confident about if I can somehow figure out this last part.

Any ideas??
So, my question is: Is there a way to get a link into Steriods in which you need to have a few things AFTER the apikey… &kimhash=1&kimmodify=1 in this case an API that contains something like this  https://www.kimonolabs.com/api/{indentifier}{apikey}&kimhash=1&kimmodify=1

