def generate_rule(input_data, rule_number):
    # Extract input values
    attributes = ['color', 'exposure', 'size', 'type', 'period', 'identity', 'tally']
    values = {attr: input_data.get(attr, '').split() for attr in attributes}
    
    # Initialize rule components
    conditions = []
    
    # Build conditions for each attribute
    for attr in attributes[:-2]:  # Exclude 'identity' and 'tally'
        if values[attr]:
            if len(values[attr]) > 1:
                condition = '($or ' + ' '.join(f'(same cntxt {attr} {val})' for val in values[attr]) + ')'
            else:
                condition = f'(same cntxt {attr} {values[attr][0]})'
            conditions.append(condition)
    
    # Combine conditions with $and if there are multiple conditions
    if len(conditions) > 1:
        rule_conditions = '($and ' + ' '.join(conditions) + ')'
    else:
        rule_conditions = conditions[0]
    
    # Build the rule
    rule = f'(rule{rule_number:03d} {rule_conditions}\n        (conclude cntxt identity {values["identity"][0]} tally {values["tally"][0]}))'
    
    return rule

# Example input 1
input_data_1 = {
    'color': 'yellow green',
    'exposure': 'sun',
    'size': 'huge',
    'type': 'tree',
    'period': 'spring',
    'identity': 'black-willow',
    'tally': '1000'
}

# Example input 2
input_data_2 = {
    'color': 'yellow',
    'period': 'spring fall winter',
    'identity': 'foo-bar',
    'tally': '800'
}

# Generate rules for the examples
rule1 = generate_rule(input_data_1, 1)
rule2 = generate_rule(input_data_2, 200)

print("Example Output 1:")
print(rule1)
print("\nExample Output 2:")
print(rule2)
