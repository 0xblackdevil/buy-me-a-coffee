// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BuyMeACoffee {
    // events to emit when a Memo is created
    event MemoCreated(address indexed from, string message);

    // Memo data struct
    struct Memo {
        address from;
        uint256 timestemp;
        uint amount;
        string name;
        string message;
    }

    // list of all Memos
    Memo[] memos;

    // contract owner variable
    address payable owner;

    // deploy logic
    constructor() {
        owner = payable(msg.sender);
    }

    /**
     * @dev function for buy coffee for contract owner
     * @param _name name of coffee buyer
     * @param _message sweet message from buyer
     */
    function buyCoffee(
        string memory _name,
        string memory _message
    ) public payable {
        require(msg.value > 0, "You need to send some ether");
        memos.push(
            Memo(msg.sender, block.timestamp, msg.value, _name, _message)
        );
        emit MemoCreated(msg.sender, _message);
    }

    /**
     * @dev function for withdraw all contract balance to owner
     */
    function withdraw() public {
        require(msg.sender == owner, "You are not the owner");
        owner.transfer(address(this).balance);
    }

    /**
     * @dev function for view all memos
     */
    function viewMemos() public view returns (Memo[] memory) {
        return memos;
    }

    /**
     * @dev function for get total balance of contract
     */

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
