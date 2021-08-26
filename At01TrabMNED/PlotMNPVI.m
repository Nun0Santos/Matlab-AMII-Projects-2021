%MENUMNPVI  Menu de Gráficos para Métodos Numéricos para um PVI
%   y = PlotMNPVI(f,a,b,n,y0)
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

function y=PlotMNPVI(f,a,b,n,y0)
y=[];
menuMNPVI = 1;
h=(b-a)/n;
t=a:h:b;
while menuMNPVI~=5
    clc
    disp('--------------------------------------------------')
    disp('           Métodos Numéricos para PVI             ')
%     disp('--------------------------------------------------')
    menuMNPVI=menu('Gráficos dos Métodos Numéricos para PVI', ...
                   'Exata',...
                   'Método de Euler',...
                   'Método RK2',...
                   'Método RK4',...
                   'Método ODE45',...
                   'Método DormandPrince',...
                   'Todos',...
                   'Saír');
    switch menuMNPVI
        case 1
            try 
              syms y(t)
              sExata = dsolve(diff(y,t)==f(t,y),y(a)==y0)

              g=@(t) eval(vectorize(char(sExata)));
              h=(b-a)/n;
              t=a:h:b;
              yExata=g(t);
              plot(t,yExata,"-ro")
            catch 
                disp('--Erro na exata--')
            end
        case 2
              yEulerM = MEulerMelh(f,a,b,n,y0);
              plot(t,yEulerM,"g*:")
        case 3  
              yRK2 = RK2(f,a,b,n,y0);
              plot(t,yRK2,"m*:")
        case 4
              yRK4 = RK4(f,a,b,n,y0);
              plot(t,yRK4,"cx-")
        case 5
              yODE45 = ODE45(f,a,b,n,y0);
              plot(t,yODE45,"k*--")
        case 6
              yDormandPrince = DormandPrince(f,a,b,n,y0);
              plot(t,yDormandPrince,"bx-.")
        case 7   %todos
            yEuler = MEuler(f,a,b,n,y0);
            yEulerM = MEulerMelh(f,a,b,n,y0);
            yRK2 = RK2(f,a,b,n,y0);
            yRK4 = RK4(f,a,b,n,y0);
            yODE45 = ODE45(f,a,b,n,y0);
            yDormandPrince = DormandPrince(f,a,b,n,y0);
            
            %Exata
            try
            syms y(t)
            sExata = dsolve(diff(y,t)==f(t,y),y(a)==y0)
            g=@(t) eval(vectorize(char(sExata)));
            h=(b-a)/n;
            t=a:h:b;
            yExata=g(t);
            
            hold on
            plot(t,yExata,"-ro")
            plot(t,yEuler,"-gs")
            plot(t,yEulerM,"g*:")
            plot(t,yRK2,"m*:")
            plot(t,yRK4,"cx-")
            plot(t,yODE45,"k*--")
            plot(t,yDormandPrince,"bx-.")
            hold off
            grid on
            legend('Exata','Euler','EulerM','RK2','RK4','ODE','DormandPrince')
            catch 
                disp('--Erro na exata--')
                hold on
                plot(t,yEuler,"-gs")
                plot(t,yEulerM,"g*:")
                plot(t,yRK2,"m*:")
                plot(t,yRK4,"cx-")
                plot(t,yODE45,"k*--")
                plot(t,yDormandPrince,"bx-.")
                hold off
                grid on
                legend('Euler','EulerM','RK2','RK4','ODE','DormandPrince')
            end
        case 8
            break
    end
    input('Prima numa tecla para continuar »')
end

end