import { defineConfig } from "unocss";
import { presetWind3 } from "unocss";

export default defineConfig({
  content: {
    filesystem: ["lib/**/*.{dart,html,xml}"],
  },
  presets: [presetWind3()],
  rules: [["m-1", { margin: "1px" }]],
  safelist: ["m-1"],
});
