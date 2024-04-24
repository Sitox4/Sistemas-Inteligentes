%Codigo ejercicio 2


arquitectura = { [], [7], [9], [4], [1 9] , [9 7] ,[4 4], [8 5] };

for j = 1 : length (arquitectura) , 
        arquitectura2 = arquitectura {j} ;
        precisionEntrenamiento = [];
        precisionValidacion = [];
        precisionTest = [];

for i=1:50 ,
rna = patternnet(arquitectura2);
rna.trainParam.showWindow = false;
[rna,tr] = train(rna, entradas, salidasDeseadas);
salidasVerdaderas = sim(rna, entradas);
precisionEntrenamiento(end+1) = 1-confusion(salidasDeseadas(:,tr.trainInd), ...
    salidasVerdaderas(:,tr.trainInd));
precisionValidacion(end+1) = 1-confusion(salidasDeseadas(:,tr.valInd),salidasVerdaderas(:,tr.valInd));
precisionTest(end+1) = 1-confusion(salidasDeseadas(:,tr.testInd), salidasVerdaderas(:,tr.testInd));
end;
mediaPrecisionTest = mean(precisionTest)
desviacionTipicaPrecisionTest = std(precisionTest)
end ;

