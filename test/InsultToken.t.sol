// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Insultcoin} from "../src/InsultToken.sol";

contract CounterTest is Test {
       Insultcoin public insultcoin;

    function setUp() public {
        // Deploy the token contract with an initial supply
        insultcoin = new Insultcoin();
    }

    function testInitialSupply() public {
        // Test the initial total supply is as expected
        uint256 initialSupply = 1_000_000_000 * 10 ** 18; // Adjust according to your token's initial supply
        assertEq(insultcoin.totalSupply(), initialSupply, "Initial supply should match the specified amount.");
    }

    function testTransfer() public {
        // Test transferring tokens
        address recipient = address(0x1);
        uint256 transferAmount = 100 * 10 ** 18; // 100 tokens for example

        // Assume the deployer has the initial supply, so we use the deployer address to send tokens
        address deployer = address(this);

        // Check deployer's balance before transfer
        uint256 deployerBalanceBefore = insultcoin.balanceOf(deployer);
        uint256 recipientBalanceBefore = insultcoin.balanceOf(recipient);

        // Execute the transfer
        insultcoin.transfer(recipient, transferAmount);

        // Check balances after transfer
        uint256 deployerBalanceAfter = insultcoin.balanceOf(deployer);
        uint256 recipientBalanceAfter = insultcoin.balanceOf(recipient);

        // Assertions
        assertEq(deployerBalanceBefore - transferAmount, deployerBalanceAfter, "Deployer's balance should decrease by the transfer amount.");
        assertEq(recipientBalanceBefore + transferAmount, recipientBalanceAfter, "Recipient's balance should increase by the transfer amount.");
    }

}
