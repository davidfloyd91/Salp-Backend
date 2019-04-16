# Salp

A simple, intuitive chart-making application that uses Chart.js. Using Salp, you can:

+ input data manually or by uploading a CSV;
+ turn that data into a line, bar or pie chart;
+ customize the chart's presentation;
+ save and edit charts;
+ generate an iframe of a chart to embed on your site.

## Installation
#### Backend

This repository contains Salp's backend. To install it, in the the terminal:

+ run `git clone git@github.com:davidfloyd91/Salp-Backend.git` in your desired directory;
+ run `cd Salp-Backend`;
+ run `bundle`;
+ run `rails s`.

The database will run at `localhost:3000`.

#### Frontend

The frontend lives at https://github.com/davidfloyd91/Salp. To install it, in the terminal:

+ run `git clone git@github.com:davidfloyd91/Salp.git` in your desired directory;
+ run `cd Salp`;
+ run `npm i`;
+ run `npm start`.

Then:

+ visit `localhost:3001` in the browser.

## Demo

Todo.

## Known bugs

After saving a chart, the data for that chart will sometimes appear in the manual input fields for a new chart. These data do not affect the actual chart's display, which treats the fields as blank, and they can simply be overwritten.

## License

Salp is licensed under the MIT License.

Copyright 2019 David Floyd.
