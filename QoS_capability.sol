pragma solidity ^0.4.25;
contract QoS_capability {
    mapping (uint=>mapping(address=>mapping(address=>mapping(uint=>string))))  QoS_capabilities;
    function add_QoS_capability(uint domain_id,address rn,address _trustee,uint _tw,string QoS) public {
        QoS_capabilities[domain_id][rn][_trustee][_tw]=QoS;

    }
    function get_QoS_capability(uint domain_id, address rn, address _trustee,uint _tw) public view
    returns(string) {
        return QoS_capabilities[domain_id][rn][_trustee][_tw];
    }
}
