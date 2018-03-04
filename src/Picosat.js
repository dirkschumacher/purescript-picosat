"use strict";

// module Picosat

const picosat_sat = require("picosat");

exports.ffi_picosat_sat = function(formula) {
  return function(y) {
    return picosat_sat(formula, y);
  };
};
