from web3 import Web3
from web3.middleware import construct_sign_and_send_raw_middleware
from web3.contract import Contract
import json
import os


API_OUT_PATH = '/Users/eric/ethernaut/out/'
HTTP_PROVIDER = os.getenv('SEPOLIA_RPC_URL')

w3 = Web3(Web3.HTTPProvider(HTTP_PROVIDER))
acct = w3.eth.account.from_key(os.getenv('PRIVATE_KEY'))
w3.eth.default_account = acct.address
w3.middleware_onion.add(construct_sign_and_send_raw_middleware(acct))
w3_contract_instance = {}

def get_w3():
    return w3

def get_contract(contract_address: str, contract_name: str) -> Contract:
    with open(API_OUT_PATH + contract_name + '.sol/' + contract_name + '.json', 'rb') as f:
        abi = json.load(f)['abi']
    contract = w3.eth.contract(address=contract_address, abi=abi)
    w3_contract_instance[contract_name] = contract
    return contract
