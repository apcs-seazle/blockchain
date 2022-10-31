const testtoken = artifacts.require('testtoken');
module.exports = function(_deployer) {
    _deployer.deploy(testtoken);
};
