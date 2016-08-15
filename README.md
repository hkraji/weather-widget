##Preview

<img src="https://github.com/jezuk/weather-widget/blob/master/assets/images/weather_widget.png" width="400px">

##Description

Weather widget for [Dashing](http://shopify.github.com/dashing) that displays weather and changes background color accordingly. Uses [OpenWeatherMap API](http://openweathermap.org/).

##Usage

To use this widget, copy `widgets/weather`, `assets/fonts`, `assets/stylesheets`, `jobs/weather.rb` to same folders in your dashing app.

In your dashing layout file add following snippet to add weather widget.  See below to replace xxxxxx with the correct CITY_ID

    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="weather-xxxxxx" data-view="Weather"></div>
    </li>


##Settings

You will need to provide [CITY_ID](http://bulk.openweathermap.org/sample/city.list.json.gz) and register with OpenWeatherMap to get [API_KEY](http://openweathermap.org/appid).
Add each location ID to CITY_IDS in the `weather.rb` job file this must also match in the dashboard layout file above.
Rest of the settings are well commented in the code and can be changed, this includes changing climacons icons and colors. Any contributions to more rich experience with these settings are welcomed.

##Contribution

Special thanks to contributions from

[David Underword](https://github.com/davefp) for providing original [weather widget](https://gist.github.com/davefp/4990174)

[Adam Whitcroft](https://github.com/AdamWhitcroft) for creating awesome [climacons font](http://adamwhitcroft.com/climacons/)

Forked from [Haris Krajina](https://github.com/hkraji)
