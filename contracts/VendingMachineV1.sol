// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract VendingMachineV1 is Initializable {
    // these state variables and their values
    // will be preserved forever, regardless of upgrading
    uint public numSodas;
    address public owner;
    mapping(address => uint) amountOfSodasPurchased;

    function initialize(uint _numSodas) public initializer {
        numSodas = _numSodas;
        owner = msg.sender;
    }

    function purchaseSoda() public payable {
        require(numSodas > 0);
        require(msg.value >= 1000 wei, "You must pay 1000 wei for a soda!");
        numSodas--;
        amountOfSodasPurchased[msg.sender] =
            1 +
            amountOfSodasPurchased[msg.sender];
    }

    function withdraw() public payable initializer {}

    function addSodas(uint extraSoda) public {
        numSodas = numSodas + extraSoda;
    }
}
