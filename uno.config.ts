import { defineConfig, presetWind3, type UserConfig } from "unocss";

export const sharedContent = [
  "lib/plus_trick.dart",
  "lib/shared/**/*.{dart,html,xml}",
];

export const sharedConfig: UserConfig = {
  content: {
    filesystem: sharedContent,
  },

  presets: [presetWind3()],
  rules: [["m-1", { margin: "1px" }]],
  safelist: ["m-1"],
};

export default defineConfig(sharedConfig);
