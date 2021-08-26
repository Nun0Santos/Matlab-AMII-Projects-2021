function y = ODE45(f,a,b,n,y0)
%Númerico para resolver um PVI utilizando a função ODE45 do matlab
%   y = ODE45(f,a,b,n,y0) Método numérico para a resolução de um PVI
%
%INPUT:
%   f - Função da equação diferencial, em t e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos ou iterações do método
%   y0 - Valor (condição) Inicial do PVI
%
%OUTPUT: 
%   y - vector das soluções aproximadas
%
%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   26/04/2021  Nuno Santos : a2019110035@isec.pt
%   26/04/2021  Pedro Nogueira : a2020136533@isec.pt
%   26/04/2021  João Almeida :   a2020144466@isec.pt

h = (b-a)/n;
t = a:h:b;
[~,y] = ode45(f,t,y0);
y = y.';

end

