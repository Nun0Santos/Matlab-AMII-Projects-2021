%MENUMNPVI  Menu de Métodos Numéricos para um PVI
%   y = MenuMNPVI(f,a,b,n,y0)
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das soluções aproximações
%
%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   26/04/2021  Nuno Santos      a2019110035@isec.pt
%   26/04/2021  Pedro Nogueira   a2020136533@isec.pt
%   26/04/2021  João Almeida     a2020144466@isec.pt

function y=MenuMNPVI(f,a,b,n,y0)
y=[];
menuMNPVI = 1;
while menuMNPVI~=5
    clc
    disp('--------------------------------------------------')
    disp('           Métodos Numéricos para PVI             ')
    disp('--------------------------------------------------')
    menuMNPVI=menu('Métodos Numéricos para PVI', ...
                   'Exata',...
                   'Método de Euler',...
                   'Método RK2',...
                   'Método RK4',...
                   'Método ODE45',...
                   'Método DormandPrince',...
                   'Saír');
    switch menuMNPVI
        case 1
              syms y(t)
              sExata = dsolve(diff(y,t)==f(t,y),y(a)==y0)

              g=@(t) eval(vectorize(char(sExata)));
              h=(b-a)/n;
              t=a:h:b;
              y=g(t);
              disp('-----------Solução exata do PVI---------')
        case 2
              y=MEulerMelh(f,a,b,n,y0);
              disp('-----------Solução aproximada do PVI---------')
        case 3  
              y=RK2(f,a,b,n,y0); 
              disp('-----------Solução aproximada do PVI---------')
        case 4
              y=RK4(f,a,b,n,y0);
              disp('-----------Solução aproximada do PVI---------')
        case 5
              y=ODE45(f,a,b,n,y0);
              disp('-----------Solução aproximada do PVI---------')
        case 6
              y=DormandPrince(f,a,b,n,y0);
              disp('-----------Solução aproximada do PVI---------')
        case 7
            break
    end
    %disp('-----------Solução aproximada do PVI---------')
    disp(y)
    input('Prima numa tecla para continuar »')
end

end