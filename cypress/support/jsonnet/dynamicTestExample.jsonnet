local Person (
    firstName="sdfsdfsdfs",
    lastName="sdfsdfsdfsdf",
    scenario="Verify person entity creation",
    tags=["regression"],
      ) = {
    payload: {
        firstName: firstName,
        lastName: lastName,
    },
    scenario: scenario,
    tags: tags,
    testIdentifier : std.md5(self.scenario)
};

local Address(
    address1="",
    address2="",
    city="",
    state="",
    zip="",
    country="",
) = {
    payload+: {
        address: {
            [ if !std.isEmpty(address1) then 'address1']: address1,
            [ if !std.isEmpty(address2) then 'address2']: address2,
            [ if !std.isEmpty(city) then 'city']: city,
            [ if !std.isEmpty(state) then 'state']: state,
            [ if !std.isEmpty(zip) then 'zip']: zip,
            [ if !std.isEmpty(country) then 'country']: country,
        }
    }
};
local testModel = import "testModel.jsonnet";
local positiveScenarios = [
    Person(scenario="Verify person entity can be created with empty address", tags=["regression", "person"]),
    Person(scenario="Verify person entity can be created with address info", tags=["regression", "person"]) + Address(
        address1="dfsdfsdfsdfsd",address2="dsfsdfsdfsd",country="USA",
    ),
    Person(scenario="Verify person entity can be created with foreign address info", tags=["regression", "person"]) + Address(
        address1="Dsfsdfsdfsd",address2="dsfsdfsdfsd", country="CANADA",
    ),
];
local negativeScenarios = [
    Person(firstName="", scenario="Verify person entity cannot be created with empty first name", tags=["regression", "person"]),
    Person(lastName="", scenario="Verify person entity cannot be created with empty last name", tags=["regression", "person"]),
    Person(lastName="dfhbsdfbsjdfnsd", scenario="Verify person entity cannot be created with name longer than 20 characters", tags=["regression", "person"]),

];
if std.extVar("testDefinition") == "true"  then testModel.testDefinition(positiveScenarios,negativeScenarios) else testModel.testData(positiveScenarios,negativeScenarios)
