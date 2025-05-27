const { create } = require('ipfs-http-client');
const fs = require('fs');
const path = require('path');

// Connect to local IPFS node
const ipfs = create({ host: 'localhost', port: 5001, protocol: 'http' });

async function main() {
  // Sample course data
  const courseData = {
    title: "Web3 Fundamentals",
    studentAddress: "0x123...abc",
    instructor: "Dr. Satoshi",
    completionDate: new Date().toISOString().split('T')[0]
  };

  // 1. Generate metadata JSON
  const metadata = {
    name: `${courseData.title} Completion Certificate`,
    description: `Awarded to ${courseData.studentAddress}`,
    image: "ipfs://Qm.../certificate.png", // Replace with actual CID
    attributes: [
      { trait_type: "Course", value: courseData.title },
      { trait_type: "Student", value: courseData.studentAddress },
      { trait_type: "Completion Date", value: courseData.completionDate },
      { trait_type: "Instructor", value: courseData.instructor }
    ]
  };

  // 2. Save to file
  const metadataPath = path.join(__dirname, 'metadata.json');
  fs.writeFileSync(metadataPath, JSON.stringify(metadata));

  // 3. Upload to IPFS
  const result = await ipfs.add(fs.readFileSync(metadataPath));
  console.log(`Metadata CID: ${result.cid.toString()}`);
  console.log(`Token URI: ipfs://${result.cid.toString()}`);
}

main().catch(console.error);