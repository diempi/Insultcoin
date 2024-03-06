// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Insultcoin} from "../src/InsultToken.sol";


contract InsultcoinScript is Script {

    /**
     * @dev Relevant source part starts here and spans across multiple lines
     */
    function setUp() public {
    }

    /**
     * @dev Main deployment script
     */
    function run() public {
        // Setup
        uint256 deployerPrivateKey = vm.envUint("WALLET_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy
        Insultcoin islt = new Insultcoin();

        // Verify + End
        console.log(islt.totalSupply());
        vm.stopBroadcast();
    }

}
