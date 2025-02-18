async function main() {
  const DocumentVerifier = await ethers.getContractFactory("LxBWSCertificateAttendance");
  const verifier = await DocumentVerifier.deploy();
  await verifier.deployed();
  console.log("DocumentVerifier deployed to:", verifier.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
