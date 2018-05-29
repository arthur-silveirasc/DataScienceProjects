%%
clear
close all;
clc

%%
% transformação da base treino. Esse arquivo contém apenas as 10.000
% primeiras linhas da base disponibilizada no Classroom, já que houve
% uma demora acima do normal para leitura da base com as 400.000 linhas
[train_xls,train_xls_tranformed] = load_database('covtype_train.xlsx');

%%
% transformação da base teste
[test_xls, test_xls_tranformed] = load_database('covtype_test.xlsx');


%% FASE de treino
% escolhendo as colunas a serem utilizadas como atributos. 
% para gerar os histogramas, foi usada a variável
% columns = [2 3 4 5 6 7 8 9 10 11 12 13]
% por tentativa e erro, avaliando a acurácia ao final do script, chegamos
% às colunas abaixo
columns = [2 3 13];
groups = unique(train_xls_tranformed(:,end));

% probabilidades a priori de cada grupo
prior = histc(train_xls_tranformed(:,end), groups) / ...
    length(train_xls_tranformed(:,end));

% utilização dos dados transformados
data = train_xls_tranformed(:, columns);

% histograma de cada atributo para avaliar, visualmente, 
% de acordo com o formato do gráfico, qual densidade de probabilidade 
% - ou função massa de probabilidade - mais se adequa ao atributo

%atributo elevation
%figure
%hist(data(:,1),100), grid minor, grid on;

%atributo aspect
%figure
%hist(data(:,2),100), grid minor, grid on;

%atributo slope
%figure
%hist(data(:,3),100), grid minor, grid on;

%atributo horizontal distance to hidrology
%figure
%hist(data(:,4),100), grid minor, grid on;

%atributo vertical distance to hidrology
%figure
%hist(data(:,5),100), grid minor, grid on;

%atributo horizontal distance to roadways
%figure
%hist(data(:,6),100), grid minor, grid on;

%atributo hillshade 9am
%figure
%hist(data(:,7),100), grid minor, grid on;

%atributo hillshade noon
%figure
%hist(data(:,8),100), grid minor, grid on;

%atributo hillshade 3pm
%figure
%hist(data(:,9),100), grid minor, grid on;

%atributo horizontal distance to fire points
%figure
%hist(data(:,10),100), grid minor, grid on;

%atributo wilderness area
%figure
%hist(data(:,11),100), grid minor, grid on;

%atributo soil type
%figure
%hist(data(:,12),100), grid minor, grid on;

for group=1:length(groups)
    data_for_group_idx = train_xls_tranformed(:,end) == groups(group);
    data_for_group=data(data_for_group_idx, :);
       
    % estima os parâmetros por máxima verosssimilhança.
    pd_2(group) = fitdist(data_for_group(:,1), 'loglogistic');
    pd_3(group) = fitdist(data_for_group(:,2), 'kernel', 'kernel','epanechnikov');
    pd_13(group) = fitdist(data_for_group(:,3), 'rayleigh');
    
end

%% fazer um split da base de treino, com 20% dedicado para teste
[r, c] = size(train_xls_tranformed);
last_row = int32(floor(0.8 * r));
% 20% teste
test = train_xls_tranformed(last_row+1:end, :);
% 80% treino
train_xls_tranformed = train_xls_tranformed(1:last_row, :);

%% faz a classificação do treino
data_test = test(:, columns);
dists = {pd_2, pd_3, pd_13};
[class, ranks] = classify_naive_bayes(data_test, dists, groups, prior);

%% realizar o cálculo da acurácia
gabarito = test(:,14);
resultado = sign(gabarito - class);
acerto = sum(resultado(:) == 0)/length(resultado)

%% faz a classificação para teste
data_test = test_xls_tranformed(:, columns);
dists = {pd_2, pd_3, pd_13};
[class, ranks] = classify_naive_bayes(data_test, dists, groups, prior);