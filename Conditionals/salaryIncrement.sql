UPDATE oldVoters
SET salary=salary*(1.05)
WHERE employmentStatus='Retired';

UPDATE oldVoters
SET salary=salary*(1.05)
WHERE NOT employmentStatus='Retired';