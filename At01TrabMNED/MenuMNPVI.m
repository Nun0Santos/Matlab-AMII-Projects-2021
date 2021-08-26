%MENUMNPVI  Menu de M�todos Num�ricos para um PVI
%   y = MenuMNPVI(f,a,b,n,y0)
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condi��o inicial  
%
%INPUT:
%   f - fun��o do 2.� membro da Equa��o Diferencial
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   y0 - condi��o inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das solu��es aproxima��es
%
%   26/03/2021  Arm�nio Correia  armenioc@isec.pt
%   26/04/2021  Nuno Santos      a2019110035@isec.pt
%   26/04/2021  Pedro Nogueira   a2020136533@isec.pt
%   26/04/2021  Jo�o Almeida     a2020144466@isec.pt

function y=MenuMNPVI(f,a,b,n,y0)
y=[];
menuMNPVI = 1;
while menuMNPVI~=5
    clc
    disp('--------------------------------------------------')
    disp('           M�todos Num�ricos para PVI             ')
    disp('--------------------------------------------------')
    menuMNPVI=menu('M�todos Num�ricos para PVI', ...
                   'Exata',...
                   'M�todo de Euler',...
                   'M�todo RK2',...
                   'M�todo RK4',...
                   'M�todo ODE45',...
                   'M�todo DormandPrince',...
                   'Sa�r');
    switch menuMNPVI
        case 1
              syms y(t)
              sExata = dsolve(diff(y,t)==f(t,y),y(a)==y0)

              g=@(t) eval(vectorize(char(sExata)));
              h=(b-a)/n;
              t=a:h:b;
              y=g(t);
              disp('-----------Solu��o exata do PVI---------')
        case 2
              y=MEulerMelh(f,a,b,n,y0);
              disp('-----------Solu��o aproximada do PVI---------')
        case 3  
              y=RK2(f,a,b,n,y0); 
              disp('-----------Solu��o aproximada do PVI---------')
        case 4
              y=RK4(f,a,b,n,y0);
              disp('-----------Solu��o aproximada do PVI---------')
        case 5
              y=ODE45(f,a,b,n,y0);
              disp('-----------Solu��o aproximada do PVI---------')
        case 6
              y=DormandPrince(f,a,b,n,y0);
              disp('-----------Solu��o aproximada do PVI---------')
        case 7
            break
    end
    %disp('-----------Solu��o aproximada do PVI---------')
    disp(y)
    input('Prima numa tecla para continuar �')
end

end