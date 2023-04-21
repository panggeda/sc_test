pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;
contract registration {
    struct node {
        uint domain_id;
        uint node_id;
        string rn;
        string public_key;

    }
    node[] public node_values;
    function add_node_values(uint domain_id,uint node_id,string node_eth_address,string pub_key)
    public {
        node_values.length++;
        node_values[node_values.length-1].domain_id=domain_id;
        node_values[node_values.length-1].node_id=node_id;
        node_values[node_values.length-1].rn=node_eth_address;
        node_values[node_values.length-1].public_key=pub_key;
    }
    function get_node_values(uint[] indexes) public view
    returns(uint[],uint[],string[],string[])
    {
        uint[] memory num=new uint[](indexes.length);
        uint[] memory id= new uint[](indexes.length);
        string[] memory eth_address =new string[](indexes.length);
        string[] memory pub_key=new string[](indexes.length);
        for(uint i=0;i<indexes.length;i++) {
            node storage n1=node_values[indexes[i]];
            num[i]=n1.domain_id;
            id[i]=n1.node_id;
            eth_address[i]=n1.rn;
            pub_key[i]=n1.public_key;

        }
        return(num,id,eth_address,pub_key);
    }
}
