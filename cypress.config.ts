import { generateTestDefinition, generateTestData } from "cy-jsonnet-plugin";
import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      on("before:run", (details) => {
        generateTestDefinition(details);
      });
      on("before:spec", (spec) => {
        generateTestData(spec);
      });

      return config;
    },
    experimentalRunAllSpecs: true,
    experimentalInteractiveRunEvents: true,
    baseUrl: "https://www.google.com/",
  },
});
