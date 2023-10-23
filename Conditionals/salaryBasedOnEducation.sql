UPDATE oldVoters
SET salary=1500
WHERE employmentStatus='Employed';

UPDATE oldVoters
SET salary=1000
WHERE employmentStatus='Retired';

UPDATE oldVoters
SET salary=salary+100
WHERE higherEducation='None' AND employmentStatus='Employed';

UPDATE oldVoters
SET salary=salary+200
WHERE higherEducation='Basic'  AND employmentStatus='Employed';

UPDATE oldVoters
SET salary=salary+300
WHERE higherEducation='Higher' AND employmentStatus='Employed';

UPDATE oldVoters
SET salary=salary+1000
WHERE higherEducation='PhD' AND employmentStatus='Employed';