function y = DormandPrince(f,a,b,n,y0)
%DormandPrince   Método Númerico para resolver um PVI/EDO: DormandPrince de ordem 4
%   y = DormandPrince(f,a,b,n,y0) Método numérico para a resolução de um PVI
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
%   26/04/2021  João Almeida     a2020144466@isec.pt
%   26/04/2021  Nuno Santos      a2019110035@isec.pt
%   26/04/2021  Pedro Nogueira   a2020136533@isec.pt
%referência: http://depa.fquim.unam.mx/amyd/archivero/DormandPrince_19856.pdf

h = (b-a)/n;      
t = a:h:b;        
y = zeros(1,n+1);
y(1) = y0;  

for i = 1:n
    k1 = f(t(i),y(i));
    k2 = f(t(i)+ h/5,y(i)+(h*k1/5));
    k3 = f(t(i)+(3/10)*h,y(i)+(3*h*k1)/40+(9*h*k2/40));
    k4 = f(t(i)+(4/5)*h,y(i)+(44*h*k1)/45-(56*h*k2)/15+(32*h*k3/9));
    k5 = f(t(i)+(8/9)*h,y(i)+(19372*h*k1)/6561-(25360*h*k2)/2187+(64448*h*k3)/6561-(212*h*k4)/729);
    k6 = f(t(i)+ h,y(i)+(9017*h*k1)/3168-(355*h*k2)/33+(46732*h*k3)/5247+(49*h*k4)/176-(5103*h*k5)/18656);
    y(i + 1) = y(i)+h*(((35*k1)/384)+((500*k3)/1113)+(125/192)*k4-(2187/6784)*k5+(11/84)*k6);
end

end