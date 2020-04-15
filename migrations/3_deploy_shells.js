/**
 * Note to self - make sure you check the migrations contract has a "2", and
 * isn't going to redeploy kame contract or else a lot of trouble!!!
 */ 
var Public = artifacts.require("Shells");

const name = "Shells";
const symbol = "SHL";
const supply = 10000000;

module.exports = function(deployer) {
  deployer.deploy(Public, name, symbol, supply);
};
