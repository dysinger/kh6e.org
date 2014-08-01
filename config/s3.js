module.exports = {

  s3: {
    options: {
      verify: true
    },
    site: { sync: [{ src: "dist/**", rel: "dist/" }] }
  }

};
