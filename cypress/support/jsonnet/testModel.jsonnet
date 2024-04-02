{
  testData(positiveScenarios,negativeScenarios) :: 
    {
      "testData" : {
         "positiveScenarios": 
         {
            [ps.testIdentifier]: ps
            for ps in positiveScenarios  
         },
        "negativeScenarios":
         {
            [ns.testIdentifier]: ns
            for ns in negativeScenarios
         },
      }
    },
    testDefinition(positiveScenarios,negativeScenarios) :: 
    {
      "testDefinitions": {
        "positiveScenarios": [
          {
            "scenario": ps.scenario,
            "testIdentifier": ps.testIdentifier,
            "tags": ps.tags + [ps.testIdentifier],
          }
          for ps in positiveScenarios
        ],
        "negativeScenarios": [
          {
            "scenario": ns.scenario,
            "testIdentifier": ns.testIdentifier,
            "tags": ns.tags + [ns.testIdentifier],
          }
          for ns in negativeScenarios
        ],
      }
    },
}