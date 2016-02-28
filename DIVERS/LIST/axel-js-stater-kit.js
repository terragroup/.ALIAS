
// ------------------------------
// configurer son ATOM
// ------------------------------
apm install quick-highlight
// CTRL + K m ou M             = (higlighter)
apm install minimap
apm install atom-beautify
apm install pigments
apm install markdown-preview  //# +++ voir en live
apm install git-log
// new
apm install seti-ui-        // voir icon sexy js et autre



// ------------------------------
// creer son 1er projet
// ------------------------------

sudo npm install gulp -g
mkdir project
cd project

npm install gulp --save-dev

touch gulpfile.js
mkdir app dist
cd app
mkdir css fonts images index.html js scss
cd ..

npm install gulp-sass --save-dev
