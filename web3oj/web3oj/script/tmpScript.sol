// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../src/transferERC20Token.sol";

contract CounterScript is Script {
    ERC20 target;
    transferERC20Token cont;
    event bal(uint256);

    function setUp() public { 
        cont = transferERC20Token(0x19bbc0e256D5F58FFa4005E5c7CE3238a95DA9AE);
        target = ERC20(0x3fE705B07828e156D0f7EDfeC23ED24582dbb54e);
    }

    function run() public {
        vm.startBroadcast();

        uint256 balance;
        balance = target.balanceOf(0xDf1867A4d659D8D3D98F1d00980C2c6Ff977CD5b);
        emit bal(balance);

        vm.stopBroadcast();
    }
}
