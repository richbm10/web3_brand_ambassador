import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const SaprissaCentenoCollectionModule = buildModule(
  "SaprissaCentenoCollectionModule",
  (m) => {
    const saprissaCentenoCollectionModule = m.contract(
      "SaprissaCentenoCollection",
      ["0x9E17D83De550DFD4585632E725fD92E72b9C3f4a", 150]
    );

    return { saprissaCentenoCollectionModule };
  }
);

export default SaprissaCentenoCollectionModule;
