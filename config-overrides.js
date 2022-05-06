/* config-overrides.js */

const path = require("path");

module.exports = {
  paths: function (paths, env) {
    paths.appIndexJs = path.resolve(__dirname, 'frontend/src/index.js');
    paths.appSrc = path.resolve(__dirname, 'frontend/src');
    // Changing public to static
    paths.appPublic = path.resolve(__dirname, 'frontend');
    paths.appHtml = path.resolve(__dirname, 'frontend/public/index.html');
    return paths;
  },
}
