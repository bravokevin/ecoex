//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

///@title the payment procesor
contract PaymentProcessor{
  address public admin;
  IERC20 public dai;


  event PaymentDone(
    address payer,
    uint amount,
    uint32 paymentId,
    uint date 
  );
  /**@dev we set the dai address to be changable for productions and test enviroments */
  constructor(address adminAddress, address daiAddress) {
    admin = adminAddress;
    dai = IERC20(daiAddress);
  }

  function pay(uint256 _amount, uint32 _paymentId) external{
    dai.transferFrom(msg.sender, admin, _amount);
    emit PaymentDone(msg.sender, _amount, _paymentId, block.timestamp);
  }
}