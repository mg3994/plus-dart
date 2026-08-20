import { defineConfig, type UserConfig } from "unocss";
import { sharedConfig, sharedContent } from "./uno.config";

const noampConfig: UserConfig = {
  ...sharedConfig,
  content: {
    filesystem: [...sharedContent, "lib/noamp/**/*.{dart,html,xml}"],
  },
  rules: [...(sharedConfig.rules ?? []), ["noamp-layout", { display: "grid" }]],
  safelist: [...(sharedConfig.safelist ?? []), "noamp-layout"],
};

export default defineConfig(noampConfig);
