const HDWalletProvider = require('@truffle/hdwallet-provider');
const Web3 = require('web3');
const compliedFactory = require('../ethereum/build/CampaignFactory.json');

const provider = new HDWalletProvider(
  'extend little analyst please apart case fruit explain fruit profit regular twelve',
  'https://rinkeby.infura.io/v3/bba99bbdc332435e9e29968b4805f93a'
);
const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account', accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(compliedFactory.interface))
    .deploy({ data: compliedFactory.bytecode })
    .send({ gas: '1000000', from: accounts[0] });

  console.log('Contract deployed to', result.options.address);
  provider.engine.stop();
};
deploy();
