pragma solidity >=0.4.11;
contract Trvalue {
struct Provider {
string name;
address owner;
uint8 [] stars; //评分
uint256  totalcounter;   
uint256 trvalueh; //h时刻的信任值
uint256 repv; // 声誉值
uint [] docounters;  
uint numser;  

}

Provider[] public providers;

event Publish(string indexed name, address indexed owner, uint providerId);
event Star(address indexed user,uint indexed providerId,uint8 num,uint counter);
function publish(string memory name) public {
require(bytes(name).length > 0,"name empty error");
providers.push(Provider(name, msg.sender,new uint8[](0),0,0,0,new uint[](0),0));
emit Publish(name, msg.sender, providers.length - 1);
}

function star(uint providerId, uint8 num, uint8 counter) public returns(uint,uint256,uint,uint) {
  // num为DA提交的信任值，counter为服务提供节点在该域的交互次数
require(providerId < providers.length,"provider id error");
require(num >= 0 && num <= 50,"star num error");

Provider storage c = providers[providerId];
c.stars.push(num);
c.totalcounter += counter;
c.docounters.push(counter);
c.numser++;
return(c.numser, c.totalcounter,c.stars[c.numser - 1], c.docounters[c.numser - 1]);

emit Star(msg.sender,providerId,num,counter);

}
function trfusion(uint providerId,uint pre_repv,uint m) public returns (uint,uint) {
  //pre_repv为上一时刻服务提供节点的声誉值

       Provider storage c = providers[providerId]; 
       for(uint i = 0; i < c.numser; i++) {
          
    c.trvalueh += (c.stars[i] * (c.docounters[i]));

} 

  c.trvalueh = c.trvalueh / c.totalcounter;
  c.repv = m * c.trvalueh + (10 - m) * pre_repv;
  
return (c.trvalueh,c.repv);

}
}
//solidity之变量运算小数点会截断,因此，程序中对一些参数进行了乘以10倍的处理。