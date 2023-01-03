const Person_Contract = artifacts.require('Person')

module.exports = function (deployer) {
    deployer.deploy(Person_Contract)
}