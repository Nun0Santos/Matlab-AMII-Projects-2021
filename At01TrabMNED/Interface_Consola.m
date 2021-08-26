%INTERFACE04MENUPVI 
%Chamada de funções
%   MenuMNPVI
%
%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   26/04/2021  Nuno Santos      a2019110035@isec.pt
%   26/04/2021  Pedro Nogueira   a2020136533@isec.pt
%   26/04/2021  João Almeida     a2020144466@isec.pt

clear
primeiraVez = 1;
menuPVI = 1;

while menuPVI~=5
    clc;
    disp('--------------------------------------------------------------')
    disp('            PROBLEMAS DE VALOR INICIAL (PVI)                  ')
    disp('------------------------------------------------------------- ')
    if (~primeiraVez)
        menuPVI=menu('Métodos Numéricos para PVI',...
            'Dados do PVI',...
            'Soluções...',...
            'Gráficos de Resultados',...
            'Saír');
    else
        primeiraVez = 0;
        menuPVI = 1;
    end
    y=[];
    switch menuPVI
        case 1
            strF = input('\n f(t,y) = ','s');
            f=@(t,y) eval(vectorize(strF));
            a=str2double(input('a = ','s'));
            b=str2double(input('b = ','s'));
            n=str2double(input('n = ','s'));
            y0=str2double(input('y0 = ','s'));
        case 2
            y=MenuMNPVI(f,a,b,n,y0);
        case 3
            y=PlotMNPVI(f,a,b,n,y0);
        case 4
            break
    end
    input('Prima numa tecla para continuar »')
end
    
