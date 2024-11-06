// SPDX-License-Identifier: UNLICENSED  
pragma solidity >= 0.7.0;

contract Bank {
    
    address public accholder;
    uint256 public balance; // Use uint256 for compatibility with Ether amounts

    constructor() {
        accholder = msg.sender;
    }

    // function to deposit Ether
    function deposit() public payable {
        require(msg.value > 0, "Amount should be > 0");
        require(msg.sender == accholder, "You are not the account owner.");
        balance += msg.value; // Increment the balance with msg.value (amount of Ether sent)
    }

    // function to show balance
    function showBal() public view returns (uint256) {
        return balance;
    }

    // function to withdraw
    function withdraw() public {
        require(balance > 0, "You don't have enough balance.");
        require(msg.sender == accholder, "You are not the account owner.");
        
        uint256 amount = balance; // Save the balance locally to avoid reentrancy issues
        balance = 0; // Set balance to 0 before transferring Ether

        payable(msg.sender).transfer(amount); // Transfer Ether
    }
}
