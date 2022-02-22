// onresize :: Task Unit -> Task Unit
exports.onResize = (e) => () => {
  return new Promise((res, rej) => {
    document.body.onresize = function () {
      e();
    };
    res();
  });
};

// onDOMContentLoaded :: Task Unit -> Task Unit
exports.onDOMContentLoaded = (cb) => () => {
  return new Promise((res, rej) => {
    document.addEventListener("DOMContentLoaded", function () {
      cb();
    });
    res();
  });
};
