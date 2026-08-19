import tailwindcss from "@tailwindcss/postcss";
import postcssNested from "postcss-nested";
import cssnano from "cssnano";

export default {
  plugins: [
    tailwindcss(),
    // 1. Safely unwrap and bubble Tailwind v4's nested @media and @supports to the root level
    postcssNested(),
    {
      postcssPlugin: "postcss-amp-sanitizer",
      Once(root) {
        // 2. Remove Tailwind comment banners
        root.walkComments((comment) => {
          if (comment.text.includes("tailwindcss")) {
            comment.remove();
          }
        });

        // 3. Strip !important flags from declarations
        root.walkDecls((declaration) => {
          declaration.important = false;
          declaration.value = declaration.value
            .replace(/!important\b/gi, "")
            .trim();
        });

        // 4. Remove disallowed AMP at-rules (AMP only accepts media, supports, keyframes, font-face)
        root.walkAtRules((atRule) => {
          const name = atRule.name.toLowerCase();
          if (!["media", "supports", "keyframes", "font-face"].includes(name)) {
            atRule.remove();
          }
        });

        // 5. Remove restricted AMP internal selectors (-amp, i-amp)
        root.walkRules(/\.-amp-|^i-amp|\si-amp/, (rule) => {
          rule.remove();
        });

        // 6. Remove disallowed properties & restrict transitions to GPU-accelerated ones
        root.walkDecls((decl) => {
          const prop = decl.prop.toLowerCase();
          const isForbiddenProp =
            prop === "behavior" || prop === "-moz-binding";
          const isInvalidTransition =
            prop === "transition" && !/opacity|transform/.test(decl.value);

          if (isForbiddenProp || isInvalidTransition) {
            const parent = decl.parent;
            decl.remove();
            if (parent && parent.nodes.length === 0) {
              parent.remove();
            }
          }
        });

        // 7. Clean up any empty rules or at-rules left behind
        root.walkRules((rule) => {
          if (!rule.nodes || rule.nodes.length === 0) {
            rule.remove();
          }
        });
        root.walkAtRules((atRule) => {
          if (!atRule.nodes || atRule.nodes.length === 0) {
            atRule.remove();
          }
        });
      },
    },

    // 8. Minify tightly to stay safely under AMP's 50KB limit
    cssnano({
      preset: [
        "default",
        {
          discardComments: { removeAll: true },
          normalizeWhitespace: true,
        },
      ],
    }),
  ],
};
