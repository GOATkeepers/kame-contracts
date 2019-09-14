const Kame = artifacts.require('./Kame.sol')

module.exports = async deployer => {
  deployer.deploy(Kame, 'Kora', 'KORA')
}
