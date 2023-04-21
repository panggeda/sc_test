pragma solidity ^0.4.25;
contract log_proof {
    mapping(address=>mapping(address=>mapping(uint=>string))) loghash;
    function add_loghash(address rn,address _trustee, uint QoS_id,string hash) public
     {
        loghash[rn][_trustee][QoS_id]=hash;
            }
    function get_loghash(address rn,address _trustee, uint QoS_id) public view returns(string)
     {
        return loghash[rn][_trustee][QoS_id]; 
    }
    

}
