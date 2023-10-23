SELECT Voters.fullName, Localities.nameL FROM Voters, Localities
WHERE Voters.locality=Localities.localityID AND Localities.populationL>'300000';