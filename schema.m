function schema = schema()
schema = struct();

schema.name.type = 'char';

% Model Settings
schema.numDeltaLelems.type  = 'double';            % Number of stroke length elements [num]
schema.FgToggle.type        = 'logical';           % Gravity toggle: 0 = No, 1 = Yes
schema.vertWindProfile.type = 'double';            % Vertical wind profile: 0 = Modelled, 1 = From dataset 
schema.vertWindProfile.validation = @() x == 0 | x == 1;