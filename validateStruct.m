function validateStruct(dataStruct, schema)
%VALIDATESTRUCT 
fields = fieldnames(schema);

for i = 1:numel(fields)
    field = fields{i};

    % Check if field is present
    if ~isfield(dataStruct, field)
        error('Missing required field: %s', field);
    end

    % Check data type
    expectedType = schema.(field).type;
    actualType = class(dataStruct.(field));
    if ~strcmp(expectedType, actualType)
        error('Field %s should be of type %s but is of type %s', field, expectedType, actualType);
    end

    % Perform custom validations if any
    if isfield(schema.(field), 'validation')
        validationFunc = schema.(field).validation;
        validationFunc(dataStruct.(field));
    end

end

