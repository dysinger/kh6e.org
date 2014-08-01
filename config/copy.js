module.exports = {

  bower: {
    files: [
      { cwd: "bower_components/L.GeoSearch/src/",
        src: ["**"],
        dest: "dist/assets/L.GeoSearch/",
        expand: true },
      { cwd: "bower_components/Leaflet.awesome-markers/dist/",
        src: ["**"],
        dest: "dist/assets/Leaflet.awesome-markers/",
        expand: true },
      { cwd: "bower_components/bootstrap/dist/",
        src: ["**"],
        dest: "dist/assets/bootstrap/",
        expand: true },
      { cwd: "bower_components/classie/",
        src: ["*.js"],
        dest: "dist/assets/classie/",
        expand: true },
      { cwd: "bower_components/font-awesome/",
        src: ["**/*.{css,eot,js,map,svg,ttf,woff}"],
        dest: "dist/assets/font-awesome/",
        expand: true },
      { cwd: "bower_components/html5shiv/dist/",
        src: ["**"],
        dest: "dist/assets/html5shiv/",
        expand: true },
      { cwd: "bower_components/jquery/dist/",
        src: ["**"],
        dest: "dist/assets/jquery/",
        expand: true },
      { cwd: "bower_components/leaflet/dist/",
        src: ["**"],
        dest: "dist/assets/leaflet/",
        expand: true }
    ]
  },

  site: {
    src: ["js/**", "img/**", "doc/**"],
    dest: "dist/assets/",
    expand: true
  }

};
