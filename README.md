Angulartestapp
==============

A base AngularJS application using CoffeeScript and Tastypie as the backend API

see [this](http://vshjxyz.github.io/blog/2013/10/04/setting-up-yeoman-and-angular-using-coffeescript/) for further explaination

How to run the app
---

1. clone this repo using `git clone https://github.com/vshjxyz/angulartestapp`
2. run `cd angulartestapp && git checkout examples-01`
3. install all the dependencies using `npm install && bower install`
4. compile the latest Angular.JS with `cd app/bower_components/angular-latest/ && npm install && grunt`
5. modify your API endpoint in the file `app/scripts/services/MyObject.coffee`
6. run `grunt server` from the root of the repo and navigate to `http://localhost:9000` to see the running application

you can skip the `git checkout examples-01` bit if you just want the master version of this repo, it will include an "evolved" version of the application explained in the tutorial
