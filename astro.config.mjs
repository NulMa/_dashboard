// @ts-check
import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  site: "https://nullma.github.io",
  base: "/_dashboard",
  output: "static",
  trailingSlash: "ignore",
  integrations: [tailwind()],
  build: {
    // GitHub Pages + `_` prefixed repo 이름 호환 목적.
    // Jekyll이 `_` prefix 파일을 무시하는 문제는 public/.nojekyll 파일로 회피한다.
    assets: "assets",
  },
  vite: {
    // 일부 mount 환경에서 node_modules/.vite 캐시 unlink가 실패하는 경우가 있어
    // 캐시를 프로젝트 외부로 뺀다. CI에선 의미 없으니 env로 override 가능.
    cacheDir: process.env.VITE_CACHE_DIR || "node_modules/.vite",
  },
});
