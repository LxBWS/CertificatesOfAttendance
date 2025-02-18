async function main() {
  const Contract = await ethers.getContractFactory("LxBWSCertificateAttendance");
  const contract = await Contract.deploy();
  console.log("Contract Deployed to Address:", contract.address);
}
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
