pragma solidity >=0.6.0;

import './interfaces/IUniswapV2ERC20.sol';
import './libraries/SafeMath.sol';

contract UniswapV2ERC20 is IUniswapV2ERC20 {
    using SafeMath for uint;
    
    string public constant override name = 'Uniswap V2';
    string public constant override symbol = 'UNI-V2';
    uint8 public constant override decimals = 18;

   constructor() public {
       _domainSeparator = keccak256(
           abi.encode(
               keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
               keccak256(bytes(name)),
               keccak256(bytes('1')),
               block.chainid(),
               address(this)
           )
       );
    }

    bytes32 public DOMAIN_SEPARATOR;
    
   uint8 public constant override decimals = 18;

    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    
    function _approve(address owner, address spender, uint value) internal {
     require(msg.sender != address(0), "ERC20: transfer from the zero account");
     }

   // Move the function declaration outside of any other functions
    bytes32 public constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    mapping(address => uint) public nonces;

   constructor() public {
       DOMAIN_SEPARATOR = keccak256(
        abi.encode(
            keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
            keccak256(bytes(name)),
            keccak256(bytes('1')),
           block.chainid(),
            address(this)
           )
        );
      }

    function _mint(address to, uint value) internal {
       //uint totalSupply = balanceOf[to];
           uint totalSupply = sub(_balances[address(0)], 0);
       }

  function _burn(address from, uint value) internal {
      require(value <= balance(), "Burn amount exceeds account balance");

  function approve(address spender, uint256 amount) external {
    require(msg.sender != address(0), "ERC20: approval from the zero account");
    super._approve(msg.sender, spender, amount);
    } // Add this closing bracket

    function transfer(address to, uint256 amount) public  returns(bool){
       require(to != address(0), "ERC20: transfer from the zero account");
      // if (_balances[msg.sender] >= amount)
         _transferInternal(msg.sender,to,amount);

       return (true); 
       }

  function approveAndTransferFrom(
    address owner,
    address spender,
    uint256 value
    ) public  returns(bool){
   require(owner !=address(0), "ERC20: transfer from the zero account");
   require(spender!=address(0)," ERC20:transfer to the zero account");

   _allowance[owner][spender] = _allowance[owner][spender].sub(value);
   _transferInternal ( owner, spender,value);

   return true;
   }

  function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
        require(deadline >= block.timestamp, 'UniswapV2: EXPIRED');
        bytes32 digest = keccak256(
            abi.encodePacked(
                '\x19\x01',
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline))
            )
        );
        address recoveredAddress = ecrecover(digest, v, r, s);
        require(recoveredAddress != address(0) && recoveredAddress == owner, 'UniswapV2: INVALID_SIGNATURE');
       _approve(owner, spender, value);
    }
}
