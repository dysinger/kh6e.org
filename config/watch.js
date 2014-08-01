module.exports = {

  assemble: {
    files: ["{,*/}*.{md,hbs,yml,less,js}"],
    tasks: ["assemble", "copy"]
  },

  ps: {
    files: ["{,*/}*.{purs}"],
    tasks: ["psc"]
  },

  livereload: {
    options: {
      livereload: "<%= connect.options.livereload %>"
    },
    files: [
      "dist/{,*/}*.html",
      "dist/assets/{,*/}*.css",
      "dist/assets/{,*/}*.js",
      "dist/assets/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
    ]
  }

};
