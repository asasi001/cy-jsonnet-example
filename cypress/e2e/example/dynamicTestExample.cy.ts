import * as testInfo from "../../fixtures/tests/dynamicTestExample.json";

describe("Cypress Dynamic Tests Positive Scenario Examples", () => {
  testInfo.testDefinitions.positiveScenarios.forEach((testMetaData) => {
    it(testMetaData.scenario, { tags: testMetaData.tags }, function () {
      expect(true).equals(true);
    });
  });
});

describe("Cypress Dynamic Tests Negative Scenario Examples", () => {
  testInfo.testDefinitions.negativeScenarios.forEach((testMetaData) => {
    it(testMetaData.scenario, { tags: testMetaData.tags }, function () {
      expect(true).equals(true);
    });
  });
}); 