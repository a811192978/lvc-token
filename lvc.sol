// SPDX-License-Identifier: SimPL-2.0
pragma solidity  ^0.7.6;

/**
 * Math operations with safety checks
 */
contract SafeMath {
  function safeMul(uint256 a, uint256 b) pure internal returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint256 a, uint256 b) pure internal returns (uint256) {
    assert(b > 0);
    uint256 c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function safeSub(uint256 a, uint256 b) pure internal returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint256 a, uint256 b) pure internal returns (uint256) {
    uint256 c = a + b;
    assert(c>=a && c>=b);
    return c;
  }
}

  
library TransferHelper {
    function safeTransfer(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FAILED');
    }

    function safeTransferFrom(address token, address from, address to, uint value) internal {
        // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x23b872dd, from, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FROM_FAILED');
    }
}

contract Lvc is SafeMath{
    string public name;
    string public symbol;
    uint8 public decimals = 3;
    uint public epoch_base = 86400;
    uint public epoch = 86400;
    uint public start_time = 1619631178;
    uint256 public totalSupply;
    uint256 public totalPower;
    uint256 public fenhongpool;
    uint256 public totalUsersAmount;
    address payable public owner;
    uint256 public profitgetALL;
    bool public is_airdrop = true;
    bool public is_mint = true;
    address public cctAddress ;
    uint public min_gasprice = 1 gwei;//最低gas价格

    uint256 public newFee = 10000000000000000; 
    uint256 public lingquFee = 10000000000000000; 
    uint256 public burnFee = 20000000000000000; 
    uint256 public releaseFee = 20000000000000000; 
    uint256 public maxBuy = 1000000; 
    uint256 public realBuy = 0; 
    uint256 public therePorift = 2;
    uint256 public fourPorift = 4;
    uint256 public price = 100000000; 
    uint256 public proofCount;
    bool public proofStatus = false;
    uint256 public profitCurrentPool; 
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    mapping (address => address) public invite;
    mapping (address => address) public inviteTwo;
    mapping (address => uint256) public power;
    mapping (address => uint256) public buy;
    mapping (address => uint256) public proof;
    mapping (address => bool) public isReceiveReward; 
    mapping (address => uint256) public last_miner;
    mapping (address => uint256) public freezeOf;
    mapping (address => uint256) public inviteCount;
    mapping (address => uint256) public rewardCount;
    mapping (address => mapping (address => uint256)) public allowance;
    mapping (uint256 => uint256) public mintScale;
    mapping (uint256 => uint256) public cctScale;
    mapping (uint256 => uint256) public mintPowerScale;


    mapping (uint256 => uint256) public firstBurnScale;
    mapping (address => uint256) public realByAddress;
    mapping (address => uint256) public inviteProfitSum;
    uint256 public profitPool;
    uint256 public profitPrice;
    uint256    maxBuyAddress = 10000;
    mapping (uint256 => uint256) public sfirstBurnScale;

    
    mapping (uint256 => uint256) public burnScale;
    mapping (uint256 => uint256) public sburnScale;
    mapping (address => bool) public burned;
    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* This notifies clients about the amount burnt */
    event Burn(address indexed from, uint256 value);
	
	/* This notifies clients about the amount frozen */
    event Freeze(address indexed from, uint256 value);
	
	/* This notifies clients about the amount unfrozen */
    event Unfreeze(address indexed from, uint256 value);

    // 铸币事件
    event Minted(
        address indexed operator,
        address indexed to,
        uint256 amount
    );

    
    event  Deposit(address indexed dst,address token, uint wad);
    event  Withdrawal(address indexed src,address token, uint wad);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor(
          address _cctToken
        ) {
         
        totalSupply = 0;// Update total supply
        name = 'LEVANCO';                                   // Set the name for display purposes
        symbol = 'LVC';                               // Set the symbol for display purposes
        owner = msg.sender;
        epoch_base = 86400;
        epoch = epoch_base;
    
        cctAddress = _cctToken;
        mintScale[0] = 2000;
        mintScale[1] = 1600;
        mintScale[2] = 1200;
        mintScale[3] = 1000;
        mintScale[4] = 1000;
        cctScale[0] = 100;
        cctScale[1] = 100;
        cctScale[2] = 200;
        cctScale[3] = 300;
        cctScale[4] = 400;
        mintPowerScale[0] = 10;
        mintPowerScale[1] = 10;
        mintPowerScale[2] = 20;
        mintPowerScale[3] = 30;
        mintPowerScale[4] = 40;
        
        firstBurnScale[0] = 0;
        firstBurnScale[1] = 600;
        firstBurnScale[2] = 800;
        firstBurnScale[3] = 1000;
        firstBurnScale[4] = 2000;
        sfirstBurnScale[0] = 0;
        sfirstBurnScale[1] = 200;
        sfirstBurnScale[2] = 300;
        sfirstBurnScale[3] = 500;
        sfirstBurnScale[4] = 1000;
        burnScale[0] = 20;
        burnScale[1] = 40;
        burnScale[2] = 60;
        burnScale[3] = 100;
        burnScale[4] = 200;
        sburnScale[0] = 10;
        sburnScale[1] = 10;
        sburnScale[2] = 20;
        sburnScale[3] = 40;
        sburnScale[4] = 60;
        profitPrice = 1666000; 
    }

    

    receive() payable external {
    }
   
  function setcctScale(uint256 leve, uint256 scale) public {
        require(msg.sender == owner);
        cctScale[leve] = scale;
    }
    function buyToken(uint256 amount) public  payable {
        require(maxBuy >= realBuy);
        require(SafeMath.safeAdd(realByAddress[msg.sender], amount) <= maxBuyAddress);
        TransferHelper.safeTransferFrom(cctAddress ,msg.sender, address(this), SafeMath.safeMul(amount, price));
        power[msg.sender] += amount*1000;
        buy[msg.sender] += amount*1000;
        totalPower = totalPower + amount*1000;
        realBuy += amount;
        realByAddress[msg.sender] = realByAddress[msg.sender] + amount;
    }
    function isNewUser(address _add) external view  returns (bool) {
        return isReceiveReward[_add];
    }   
    function getNewUserPower()  public payable {
        require(isReceiveReward[msg.sender] != true);
        isReceiveReward[msg.sender] = true;
        power[msg.sender] =  power[msg.sender] + 100000;
        totalPower = totalPower + 100000;
    }


    /* Send coins */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0)); // Prevent transfer to 0x0 address. Use burn() instead
		require(_value > 0); 
        require(msg.sender != _to);//自己不能转给自己

        uint fee = 0;//transfer_fee(msg.sender,_value);
        uint sub_value = SafeMath.safeAdd(fee, _value); //扣除余额需要计算手续费  
        
        require(balanceOf[msg.sender] >= sub_value);//需要计算加上手续费后是否够
        if (balanceOf[_to] + _value < balanceOf[_to]) revert("overflows"); // Check for overflows

        balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], sub_value);// Subtract from the sender
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);                            // Add the same to the recipient
        totalSupply -= fee;//总量减少手续费
        emit Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
        if(fee > 0)
        emit Burn(msg.sender, fee);
        return true;
    }


    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender, 0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require(!((_value != 0) && (allowance[msg.sender][_spender] != 0)));

		require(_value >= 0); 
        allowance[msg.sender][_spender] = _value;
        return true;
    }
       

    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)  {
        if (_to == address(0)) revert();                                // Prevent transfer to 0x0 address. Use burn() instead
		if (_value <= 0) revert(); 
        require(_from != _to);//自己不能转给自己

        uint fee = 0;//transfer_fee(_from,_value);
        uint sub_value = SafeMath.safeAdd(fee, _value);   

        
        if (balanceOf[_from] < sub_value) revert();                 // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();  // Check for overflows
        if (sub_value > allowance[_from][msg.sender]) revert();     // Check allowance

        balanceOf[_from] = SafeMath.safeSub(balanceOf[_from], sub_value);                           // Subtract from the sender
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);                             // Add the same to the recipient
        allowance[_from][msg.sender] = SafeMath.safeSub(allowance[_from][msg.sender], sub_value);
        totalSupply -= fee;//总量减少手续费
        emit Transfer(_from, _to, _value);
        if(fee > 0)
        emit Burn(_from, fee);
        return true;
    }
     function getLeve(address _add) public view returns (uint256 lve) {
          if(power[_add] <= 800 * 1e3)
            {
                return 0;
            }
            else if(power[_add] < 2000  * 1e3)
            {
                return 1;   
            }
            else if(power[_add] < 12000 * 1e3)
            {
                 return 2;  
            }
            else if(power[_add] < 30000 * 1e3)
            {
                 return 3; 
            }
            else if(power[_add] > 30000  * 1e3)
            {
                 return 4;  
            }
    }
    function burn(uint256 _value) payable public returns (bool success)  {
        if(tx.gasprice < min_gasprice) revert("min_gasprice");
        require(balanceOf[msg.sender] >= _value);      
		require(_value > 0); 
        balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], _value);                   
        totalSupply = SafeMath.safeSub(totalSupply,_value);                              
        if(power[msg.sender] == 0)
            totalUsersAmount++;
        power[msg.sender] += _value * 3;
        emit Burn(msg.sender, _value);
        totalPower += _value * 3;
        reward_upline(_value);
     
        return true;
    }
  
    function reward_upline(uint256 _value) private returns (bool success){
        _value = _value * 3;     
        if(invite[msg.sender] != address(0)) 
        {
            address invite1 = invite[msg.sender];
            uint256 scale = 0;
            uint256 sscale  = 0;
             if(burned[msg.sender]) {
                if(invite[msg.sender] != address(0)) {
                    uint256 leve = getLeve(msg.sender);
                    scale = burnScale[leve];
                    
                    if (invite[invite1] != address(0)) {
                        sscale = sburnScale[leve];
                    }
                }
             } else {
                if(invite[msg.sender] != address(0)) {
                    uint256 leve = getLeve(msg.sender);
                    scale = firstBurnScale[leve];
                    
                    if (invite[invite1] != address(0)) {
                        sscale = sfirstBurnScale[leve];
                    }
                }

                burned[msg.sender] = true;
            }

            if(scale > 0)
            {   
                       
                uint256 reward = _value * scale / 10000;         

                power[invite1] = power[invite1] + reward;//减少邀请人算力
                totalPower = totalPower + reward;//减少总算力
          
                inviteProfitSum[invite1] += reward;
                emit Minted(msg.sender,invite1,reward);
            }
        

            
            if(invite[invite1] != address(0) && sscale > 0)
            {
            address invite2 =  invite[invite1];
               uint256 reward = _value * sscale / 10000;

                if(power[invite2] < reward)
                {
                    reward = power[invite2];
                }
            
                power[invite2] = power[invite2] + reward;//减少邀请人算力
                totalPower = totalPower + reward;//减少总算力
          
                inviteProfitSum[invite2] += reward;
                emit Minted(msg.sender,invite2,reward);
                return true;
            }
            return true;
        }
        return true;
    }
	
	function freeze(uint256 _value) public returns (bool success)  {
        if (balanceOf[msg.sender] < _value) revert();         
		if (_value <= 0) revert(); 
        balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], _value);                      
        freezeOf[msg.sender] = SafeMath.safeAdd(freezeOf[msg.sender], _value);                          
        Freeze(msg.sender, _value);
        return true;
    }
	
	function unfreeze(uint256 _value) public returns (bool success) {
        if (freezeOf[msg.sender] < _value) revert();        
		if (_value <= 0) revert(); 
        freezeOf[msg.sender] = SafeMath.safeSub(freezeOf[msg.sender], _value);                    
		balanceOf[msg.sender] = SafeMath.safeAdd(balanceOf[msg.sender], _value);
        Unfreeze(msg.sender, _value);
        return true;
    }

  

    
    function registration(address invite_address) public returns (bool success){
        require(invite[msg.sender] == address(0));
        require(msg.sender != invite_address);
        invite[msg.sender] = invite_address;
        if(invite[invite_address] != address(0)){
            inviteTwo[msg.sender] = invite[invite_address];
        }
        power[invite_address] += 10000;
        totalPower = totalPower + 10000;
        inviteCount[invite_address] += 1;
        inviteProfitSum[invite_address] += 10000;
        return true;
    }

    function getProfitProof()public payable returns (bool success){
        require(balanceOf[msg.sender] >profitPrice);
         uint256 leve = getLeve(msg.sender);
        require(leve > 2);     
        if(leve == 3) {
            require(proof[msg.sender] < therePorift);
        }     
        if(leve == 4) {
            require(proof[msg.sender] < fourPorift);
        }    
 
        balanceOf[msg.sender] =  balanceOf[msg.sender] - profitPrice;
        totalSupply = totalSupply - profitPrice;
        proof[msg.sender] = proof[msg.sender] + 1;
        proofCount = proofCount +1;
    }
        function gongyi(uint256 amount)public payable  {
            TransferHelper.safeTransferFrom(cctAddress ,msg.sender, address(this), amount);
            profitPool = profitPool + amount;
        }
    function getProfit()public payable returns (bool success){
        require(proofStatus);
        require(proofCount > 0);
        require(proof[msg.sender] > 0);
        uint256 amount = SafeMath.safeDiv(profitPool, proofCount) * proof[msg.sender];
  
        require(amount > 0);
        TransferHelper.safeTransfer(cctAddress,msg.sender,amount);
        profitPool -= amount;
        proofCount =  proofCount - proof[msg.sender];
        profitgetALL = profitgetALL + amount;
        proof[msg.sender] = 0;
        
    }
    
  
    function changeStatus() public {
        require(msg.sender == owner);
        if(proofStatus) {
           // proofCount = 0;
            profitCurrentPool = 0;
        }
        profitCurrentPool = profitPool;
        proofStatus = !proofStatus;

    }

   
    //挖矿
    function mint() public payable returns (bool success){
        require(is_mint,"not start mint");
        require(power[msg.sender] > 0);
        require(block.timestamp - last_miner[msg.sender] >= epoch); 
        if(tx.gasprice < min_gasprice) revert("min_gasprice");

        uint256 leve = getLeve(msg.sender);
        uint256 scale = mintPowerScale[leve];
        uint256 cctscale = cctScale[leve];
     
        uint miner_days=(block.timestamp - last_miner[msg.sender])/epoch;
        
        if(miner_days > 3)
        {
            miner_days = 3;//单次最多领取3天的
        }
        
        //第一次挖矿只能1天
        if(last_miner[msg.sender] == 0)
        {
            miner_days = 1;
        }

        //v2及以上可以3天 v1只能每天领
        if(miner_days > 1 &&  leve < 1)
        {
            miner_days = 1;
        }
        uint256 mintLeveScale = mintScale[leve];
   
        uint256 reward = power[msg.sender] * miner_days * scale / 10000;
        uint256 cctde = power[msg.sender] * miner_days * cctscale / 10000;
        uint256 realreward  = reward * mintLeveScale / 10000;
        uint256 lvcreward = reward - realreward;      

        require(cctde > 0); 
        require(reward > 0);
        require(lvcreward > 0);

        power[msg.sender] = power[msg.sender] - reward;//算力减去本次转换的
        totalPower = totalPower - reward;//减少总算力
        cctde = SafeMath.safeMul(cctde, 100000);
        TransferHelper.safeTransferFrom(cctAddress ,msg.sender, address(this), cctde);
        profitPool += cctde;
        
        balanceOf[msg.sender] =  balanceOf[msg.sender] + lvcreward;//增加余额
        totalSupply = totalSupply + lvcreward;//增加总量
        last_miner[msg.sender] = block.timestamp;//记录本次挖矿时间
        emit Minted(msg.sender,msg.sender,lvcreward);
        return true;
    }
  
}
