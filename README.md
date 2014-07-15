Akami
=====

**Akami is a seed project for building awesome websites -  or anything else.**

---

Overview
--------

[akami][akami] is originally based on a [Yeoman][yeoman]-generated
[AngularJS][angularjs] app. 

That means, the seed was already bundled with many interesting features,
such as:

* File concatenation & minification to the extreme 
([htmlmin][htmlmin], [cssmin][cssmin], [imagemin][imagemin],
[svgmin][svgmin], [ngmin][ngmin], [uglifyjs][uglifyjs]...)
* MD5 versioning of every asset
* [Bootstrap][bootstrap] CSS library
* [Bower][bower] package management
* [Grunt][grunt] build chain
* [Karma][karma]-powered, [PhantomJS][phantomjs] test suite
* Basic [Coffeescript][coffeescript] support.



Additional Features
-------------------

Though, to my taste some salt was missing. It now is a seed that comes with:

### Automatic bower imports

Thanks to [Wiredep][wiredep], no more manual references to the scripts
within your dependencies in the index.html. All your dependencies
from `bower.json` are inspected, resolved, and placed in the correct order.

### Full Coffeescript support and automatic injection

Coffee scripts are now fully supported and are seamlessly imported as well
inside your index.html file.

>>> What if I want to import some of them in a given order ??? Is there
an override in Gruntfile.js that I can use ?

>>> When reloading, only recompile jade files that have actually changed

### Jade support

### Markdown support

### Less CSS support and central inclusion



Development
-----------

1. Install node.js from Chris Lea's PPA

        sudo add-apt-repository ppa:chris-lea/node.js
        sudo apt-get update
        sudo apt-get install npm

2. Init the repository and [npm][npm] toolchain using:

        npm install
        ./node_modules/.bin/bower install

3. Run the local development server using [Brunch][brunch]

        grunt sserve

Then open [http://127.0.0.1:9000](http://127.0.0.1:9000) in your
browser.

### Testing

#### Unit

#### E2E

License
-------

MIT License


[angularjs]: http://angularjs.org/
[npm]: https://npmjs.org/
[bower]: http://bower.io/
[karma]: http://karma-runner.github.io/
[jade]: http://jade-lang.com/
[bootstrap]: http://twitter.github.com/bootstrap/
[coffescript]: http://coffeescript.org/
[less]: http://lesscss.org/
