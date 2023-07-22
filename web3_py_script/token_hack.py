from commom import get_w3, get_contract

CONTRACT_NAME = 'TokenHack'
CONTRACT_ADDRESS = '0x5F6A1e20E64dce54fD89a73001210f7d0f3e55EB'

def main():
    w3 = get_w3()
    contract = get_contract(contract_address=CONTRACT_ADDRESS, contract_name=CONTRACT_NAME)

    tx = contract.functions.hack('0x104806172a3ccacaA7Be240aE3Ad7629a9f64Fd2').transact()
    receipt = w3.eth.wait_for_transaction_receipt(tx)
    print(receipt.status)

if __name__ == '__main__':
    main()
