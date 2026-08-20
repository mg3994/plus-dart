import tailwindcss from "@tailwindcss/postcss";
import postcssNested from "postcss-nested";
import CleanCSS from "clean-css";

function ampSanitizer() {
  return {
    postcssPlugin: "postcss-amp-sanitizer",

    Once(root) {
      /*
       * ------------------------------------------------------------
       * 1. Remove unsupported at-rules
       * ------------------------------------------------------------
       */

      root.walkAtRules((rule) => {
        const name = rule.name.toLowerCase();

        if (name === "supports" || name === "property" || name === "layer") {
          if (name === "layer" && rule.nodes?.length) {
            rule.replaceWith(...rule.nodes);
          } else {
            rule.remove();
          }

          return;
        }

        /*
         * AMP allows media queries, but we normalize
         * Tailwind v4's range syntax below.
         */

        if (name === "media") {
          rule.params = normalizeMediaQuery(rule.params);
          return;
        }

        /*
         * Keep keyframes.
         */
        if (
          name === "keyframes" ||
          name === "-webkit-keyframes" ||
          name === "font-face"
        ) {
          return;
        }

        /*
         * Remove all other at-rules.
         */
        rule.remove();
      });

      /*
       * ------------------------------------------------------------
       * 2. Normalize media queries
       * ------------------------------------------------------------
       */

      root.walkAtRules("media", (rule) => {
        rule.params = normalizeMediaQuery(rule.params);
      });

      /*
       * ------------------------------------------------------------
       * 3. Remove !important
       * ------------------------------------------------------------
       */

      root.walkDecls((decl) => {
        if (decl.important) {
          decl.important = false;
        }

        decl.value = decl.value.replace(/\s*!important\b/gi, "");
      });

      /*
       * ------------------------------------------------------------
       * 4. Remove AMP internal selectors
       * ------------------------------------------------------------
       */

      root.walkRules((rule) => {
        const selector = rule.selector;

        if (/(?:^|[\s,>+~])(?:-amp-|i-amp)/i.test(selector)) {
          rule.remove();
        }
      });

      /*
       * ------------------------------------------------------------
       * 5. Remove unsupported Tailwind selectors
       *
       * AMP's CSS parser is stricter than a browser.
       * ------------------------------------------------------------
       */

      root.walkRules((rule) => {
        let selector = rule.selector;

        /*
         * Remove pseudo selectors that AMP's CSS validator
         * commonly rejects.
         */

        selector = selector
          .replace(/::backdrop\b/gi, "")
          .replace(/::file-selector-button\b/gi, "")
          .replace(/:host\b/gi, "");

        /*
         * Remove empty selector fragments.
         */

        selector = selector
          .replace(/,\s*,/g, ",")
          .replace(/^\s*,|,\s*$/g, "")
          .trim();

        if (!selector) {
          rule.remove();
          return;
        }

        rule.selector = selector;
      });

      /*
       * ------------------------------------------------------------
       * 6. Remove empty rules
       * ------------------------------------------------------------
       */

      root.walkRules((rule) => {
        if (!rule.nodes?.length) {
          rule.remove();
        }
      });

      root.walkAtRules((rule) => {
        if (!rule.nodes?.length) {
          rule.remove();
        }
      });
    },
  };
}

/**
 * Convert Tailwind v4 media range syntax:
 *
 *   (width >= 40rem)
 *   (width > 40rem)
 *   (width <= 40rem)
 *   (width < 40rem)
 *
 * into traditional media syntax.
 */
function normalizeMediaQuery(params) {
  return params
    .replace(
      /\(\s*width\s*>=\s*([0-9.]+(?:px|rem|em|ch|vw|vh|%))\s*\)/gi,
      "(min-width: $1)",
    )
    .replace(
      /\(\s*width\s*>\s*([0-9.]+(?:px|rem|em|ch|vw|vh|%))\s*\)/gi,
      "(min-width: $1)",
    )
    .replace(
      /\(\s*width\s*<=\s*([0-9.]+(?:px|rem|em|ch|vw|vh|%))\s*\)/gi,
      "(max-width: $1)",
    )
    .replace(
      /\(\s*width\s*<\s*([0-9.]+(?:px|rem|em|ch|vw|vh|%))\s*\)/gi,
      "(max-width: $1)",
    );
}

const cleanCssPlugin = () => {
  return {
    postcssPlugin: "postcss-clean-css",

    OnceExit(root, { result }) {
      /*
       * IMPORTANT:
       *
       * Use CleanCSS only for minification.
       *
       * Do NOT use Level 2 restructuring because it can
       * rewrite already-sanitized AMP CSS.
       */

      const minified = new CleanCSS({
        level: 1,
      }).minify(result.css);

      if (minified.errors.length > 0) {
        throw new Error(minified.errors.join("\n"));
      }

      result.css = minified.styles;
    },
  };
};

export default {
  plugins: [
    /*
     * Tailwind v4
     */
    tailwindcss(),

    /*
     * Flatten nested CSS.
     */
    postcssNested(),

    /*
     * AMP sanitization.
     */
    ampSanitizer(),

    /*
     * Final minification.
     */
    cleanCssPlugin(),
  ],
};
