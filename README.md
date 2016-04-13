##Preview

![](http://f.cl.ly/items/0G1b08192J2b0y3y1146/Screen%20Shot%202013-05-29%20at%203.55.22%20PM.png)

##Description

Weather widget for [Dashing](http://shopify.github.com/dashing) that displays weather and changes background color accordingly. Uses [OpenWeatherMap API](http://openweathermap.org/).

##Usage

To use this widget, copy `widgets/weather`, `assets/fonts`, `assets/stylesheets`, `jobs/weather.rb` to same folders in your dashing app.

In your dashing layout file add following snippet to add weather widget.

    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="weather" data-view="Weather"></div>
    </li>


##Settings

All customization is done in `weather.rb` job file. You will need to provide [CITY_ID](http://bulk.openweathermap.org/sample/city.list.json.gz) and register with OpenWeatherMap to get [API_KEY](http://openweathermap.org/appid).
Rest of the setting are commented in code and can easily be changed, including changing climacons icons and colors. Contributions on more rich experience with these settings are welcomed.

##Contribution

Special thanks goes to

[David Underword](https://github.com/davefp) for providing original [weather widget](https://gist.github.com/davefp/4990174)
[Christian Naths](https://github.com/christiannaths)  for creating awesome [climacons font](https://github.com/christiannaths/Climacons-Font)