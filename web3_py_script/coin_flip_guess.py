from commom import get_w3, get_contract
import time


def main():
    target_address = '0xF5aDC1aE888AB032B89C3A007F0e65FAf8d5C8AA'
    w3 = get_w3()
    coin_flip = get_contract(contract_address='0x637f58C2F5409677F4a6433f128E8A4Ac0b0d2ce', contract_name="CoinFlipGuess")

    is_done = False
    while not is_done:
        tx = coin_flip.functions.guess(target_address).transact()
        receipt = w3.eth.wait_for_transaction_receipt(tx)
        print(receipt.status)
        ok_times = coin_flip.functions.consecutiveWins().call()
        if ok_times == 10:
            is_done = True
            print('done')
        time.sleep(15)

if __name__ == '__main__':
    main()