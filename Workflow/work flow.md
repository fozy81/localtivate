#### Current Work flow

![current work flow](https://raw.githubusercontent.com/fozy81/localtivate/master/Workflow/work%20flow%20diagram.jpg)

1. Google form - base on aspects of the greenspace council survey but also including questions about growing space, local history, potential future uses.

2. Add feature on to OpenStreetMap - often small green/un-used spaces are not well mapped out. Adding them to OpenStreetMap makes them more 'visible' and the location, size, perimeter, accessibility, travel distance, connectivity, value etc can start to be analysed systematically.

3. Data from google form is automatically transferred in to google spreadsheet

4. The forms corresponding to features in OpenStreetMap are linked by tag added in OpenStreetMap 'localtivate=' followed ba a number. In future, we will just use the OpenStreetMap ID of the feature. All features in OpenStreetMap have a unique ID e.g. [](http://www.openstreetmap.org/way/270103227)

5. The OSM feature and google survey information are combined based on the OSM ID. This is done using an code script. The script merges details about the outline of the feature with the google form details

6. The resulting 'geoJson' file is easy to display on a webpage map. 

7. A webpage is produced with a map and details about each site. This can then be used to promote/discuss/analyse potential sites more widely.



