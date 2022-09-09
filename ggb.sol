// SPDX-License-Identifier: MIT
//
//
//
// Symbol : GGB
// Name : GG Brick
// Initial supply:  2,500,000 GGC
// Decimals : 18
// https://ggcoin.io/
// https://gingr.com/
// hhttps://gingr.world/
// ----------------------------------------------------------------------------
//
//
// REVOLUTIONIZING THE OLDEST INDUSTRY IN THE WORLD
//
// GG Bricks are used to build in the GinGr.world metaverse - read more at https://gingr.world/ 
// ----------------------------------------------------------------------------
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/security/Pausable.sol";

contract GGBrick is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable {
    constructor() ERC20("GG Brick", "GGB") {
        _mint(msg.sender, 2500000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
