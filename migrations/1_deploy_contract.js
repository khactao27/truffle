const Notification = artifacts.require('Notification')
const Wallet = artifacts.require('Wallet')

module.exports = function (deployer) {
    const name = "WALLETDEMO"
    const owners = ["0x28596316D20Adb7591A14c990C14CDf8822b9832", "0x2b68A0e874d502DcBf5035338B2d1196f47Fc664", "0x93c5fe0be40807478b60d8f45b1dd6d85d2f6c14"]
    deployer.deploy(Wallet(name, 2, owners));
}