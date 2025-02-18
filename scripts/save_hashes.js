// scripts/interact.js
async function main() {
    // Get the contract factory
    const DocumentVerifier = await ethers.getContractFactory("LxBWSCertificateAttendance");
    
    // Create a contract instance using your deployed contract address
    const contract = DocumentVerifier.attach("0x693f26774d637c2c61F2d84C3fD25320E8C9838F");

    // // Read method example
    // const hash = '0x1234...'; // your document hash
    // const isVerified = await contract.verifyHash(hash);
    // console.log('Document verification result:', isVerified);

    // Write method example
    const hashes = [
'0x11fa2ceca09ad3cafe47069933c3407307971438da79d8130fe86f98f8b88730',
'0x798e0a052c6efc42aa71de63411414417da9a88f4e9ea85665fed088a58e01e8',
'0xe1269899e83bdb5c96fd27cf2898eefa3aeb014357b499bb76736876b1819c5e',
'0xd596a7cc7ca5a25941c85db635de00686ce6dcf0418ff267bee12642aba286cd',
'0xd62f921c83407c9ce285306402f6aad99bb6df36168e6783cf440970684b7ddf',
'0x6668bce4f2f6eb1e3b8c408eefa3ebef12149a86dca5d8947de2f55e7e9e9cfb'


    ];
    const tx = await contract.addDocuments(hashes);
    
    // Wait for transaction to be mined
    await tx.wait();
    
    console.log('Transaction hash:', tx.hash);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });