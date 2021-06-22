//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


/**@title Dai contract token
@dev this is a contract for test porpusese
 */
contract Dai is ERC20{
constructor() ERC20('Dai', "DAI"){}

function faucet(address _to, uint _amount) external{
    _mint(_to, _amount);
}
}