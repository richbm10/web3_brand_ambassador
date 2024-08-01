import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MafiBrandAmbassadorModule = buildModule(
  "MafiBrandAmbassadorModule",
  (m) => {
    const mafiBrandAmbassadorModule = m.contract(
      "MafiBrandAmbassador",
      ["0x9E17D83De550DFD4585632E725fD92E72b9C3f4a", "0xC688AFb094F257A58e50d52d52BABC8d08Efc17e", 10000000000000]
    );

    return { mafiBrandAmbassadorModule };
  }
);

export default MafiBrandAmbassadorModule;
