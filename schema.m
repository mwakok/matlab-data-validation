function schema = schema()
schema = struct();

schema.name.type = 'char';

% Model Settings
schema.numDeltaLelems.type = 'double';
schema.FgToggle.type = 'logical';
schema.vertWindProfile.type = 'double';

% Wind Parameters
schema.vw_ref.type = 'double';
schema.h_ref.type = 'double';
schema.windShearExp.type = 'double';
schema.windShearExp.validation = @mustBeValidWindShearExp;

% Sample vertical wind profile datasets
schema.h_windDataset.type = 'double';
schema.v_windDataset_Cabauw.type = validateattributes(@(x), {'numeric'});


end




%% Validation functions

function mustBeValidWindShearExp(x)
    if ~(x == 0.143 || x == 0.11)
        error('Field windShearExp must be 0.143 (over land) or 0.11 (over sea).');
    end
end