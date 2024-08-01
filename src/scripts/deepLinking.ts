function capitalizeFirstLetter(string: string): string {
  if (string.length === 0) return string; // Handle empty string
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function getDeepLink(
  appName = "mafi",
  domain = "mafi.onelink.me",
  affiliate = "0x0b25521dFa86D6dda99eDbd65f383ED6051891a6",
  channel = "email",
  templateId = "ja22",
  nft_collection = "saprissa_centeno_collection"
) {
  const pid = capitalizeFirstLetter(channel);
  const queryParams = new URLSearchParams(
    `af_xp=${channel}&pid=${pid}&c=${nft_collection}&deep_link_value=purchase&deep_link_sub1=navigation&af_dp=${appName}%3A%2F%2F&utm_campaign=${nft_collection}&utm_source=${affiliate}&utm_medium=${channel}&utm_term=mobile`
  );
  const encodedURI = encodeURI(
    `https://${domain}/${templateId}?${queryParams.toString()}`
  );
  return encodedURI;
}

const appName = "mafi";
const domain = "mafi.onelink.me";
const affiliates = [
  "0x0b25521dFa86D6dda99eDbd65f383ED6051891a6",
  "0x7Bd09a8Ec7411Ca0C2Da67eD5797eb08e01Ab0a1",
];
const affiliateLinks = [];

for (const affiliate of affiliates) {
  console.log(`Preparing Deep Link for Affiliate: ${affiliate}`);
  const deepLink = getDeepLink(
    appName,
    domain,
    affiliate,
    undefined,
    undefined,
    "saprissa_centeno_collection"
  );
  affiliateLinks.push(deepLink);
}

console.log("Affiliates Deep Links:", affiliateLinks);
