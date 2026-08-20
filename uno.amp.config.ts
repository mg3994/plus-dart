import { defineConfig, type UserConfig } from "unocss";
import { sharedConfig, sharedContent } from "./uno.config";

const ampConfig: UserConfig = {
  ...sharedConfig,
  content: {
    filesystem: [...sharedContent, "lib/amp/**/*.{dart,html,xml}"],
  },
  rules: [...(sharedConfig.rules ?? []), ["amp-layout", { display: "block" }]],
  safelist: [...(sharedConfig.safelist ?? []), "amp-layout"],
};

export default defineConfig(ampConfig);
