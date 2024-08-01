import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MafiBrandAmbassadorModule = buildModule(
  "MafiBrandAmbassadorModule",
  (m) => {
    const mafiBrandAmbassadorModule = m.contract(
      "MafiBrandAmbassador",
      ["0x9E17D83De550DFD4585632E725fD92E72b9C3f4a", "0x4DC1E9c38E0D80960A45a16D2783D61c3E2c6550", 10000000000000]
    );

    return { mafiBrandAmbassadorModule };
  }
);

export default MafiBrandAmbassadorModule;
