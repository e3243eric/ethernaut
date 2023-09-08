# Run tests
```
forge test --rpc-url $SEPOLIA_RPC_URL -vvv --match-contract <contract>
```

# Deploy Contract
```
forge script --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast script/<contract>
```
