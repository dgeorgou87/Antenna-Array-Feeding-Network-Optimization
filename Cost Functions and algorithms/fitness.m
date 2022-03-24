function z=fitness(W,sw)         %fitness function that must be maximised

switch sw
    case 1
        Zr=73;
        I1real=0.5799;
        I1im=0;
        I2real=0.6603;
        I2im=0;
        I3real=0.8751;
        I3im=0;
    case 2
        Zr=73+42.5*1i;
        I1real=0.5799;
        I1im=0;
        I2real=0.6603;
        I2im=0;
        I3real=0.8751;
        I3im=0;
end
        
er=4.2;               %FR4 dielectric constant
th=18e-6;              %conductor thickness
d=1.55e-3;            %dielectric thickness
tand=0.02;            %FR4 loss tangent
f=300e6;              %operating frequency
wavelength=1;
%b=2*pi/wavelength;    %phase constant for wavelength=1
s=5.7e7;              %copper conductivity
m=1.256e-6;           %copper magnetic permeability µ
Rs=sqrt(pi*f*m/s);    %copper surface resistance


%calculating characteristic impendances Zo(i)

Fi=zeros(7,1);
er_eff=zeros(7,1);
Zo=zeros(7,1);
ad=zeros(7,1);
Lamda=zeros(7,1);
ac=zeros(7,1);
a=zeros(7,1);
g=zeros(7,1);
Zin=zeros(7,1);
b=zeros(7,1);

for k=1:7
    if (W(k)/d)>1
        Fi(k)=1/sqrt(1+12*d/W(k));
    else
        Fi(k)=(1/sqrt(1+12*d/W(k)))+0.04*((1-W(k)/d)^2);
    end
    
    
    er_eff(k)=(er+1)/2+(er-1)*Fi(k)/2-(er-1)*th/(4.6*sqrt(W(k)*d));
    b(k)=2*pi*sqrt(er_eff(k));
    
    
    if (W(k)/d)>1
        Zo(k)=120*pi/(sqrt(er_eff(k))*(W(k)/d+1.393+0.667*log(W(k)/d+1.444)));      
    else
        Zo(k)=60*log(8*d/W(k)+W(k)/(4*d))/sqrt(er_eff(k));
    end
    
    
    ad(k)=b(k)*er*(er_eff(k)-1)*tand/(2*er_eff(k)*(er-1));      %conductor losses
    
    
    if (W(k)/d)>(1/(2*pi))
        Lamda(k)=1+d*(1-1.25*th/(pi*d)+1.25*log(2*d/th)/pi)/W(k);
    else
        Lamda(k)=1+d*(1+1.25*th/(pi*W(k))+1.25*log(4*pi*W(k)/th)/pi)/W(k);
    end
    
    if (W(k)/d)>1
        ac(k)=(6.1e-5)*Rs*Zo(k)*er_eff(k)*Lamda(k)*(W(k)/d+0.667*W(k)/(d*((W(k)/d)+1.444)))/d;
    else
        ac(k)=1.38*Rs*Lamda(k)*(32-(W(k)/d)^2)/(Zo(k)*d*(32+(W(k)/d)^2));
    end
    
    a(k)=ac(k)+ad(k);    %loss factor
    g(k)=a(k)+b(k)*1i;


    

end
    
%calculate SWR

Zin(1)=InputImpedance(Zo(1),Zr,g(1),W(8));
Zin(2)=InputImpedance(Zo(2),Zr,g(2),W(9));
ZinAA=Zin(1)*Zin(2)/(Zin(1)+Zin(2));


Zin(3)=InputImpedance(Zo(3),Zr,g(3),W(10));
Zin(4)=InputImpedance(Zo(4),Zr,g(4),W(11));
ZinBB=Zin(3)*Zin(4)/(Zin(3)+Zin(4));


Zin(5)=InputImpedance(Zo(5),ZinAA,g(5),W(12));
Zin(6)=InputImpedance(Zo(6),ZinBB,g(6),W(13));
ZinCC=Zin(5)*Zin(6)/(Zin(5)+Zin(6));


Zin(7)=InputImpedance(Zo(7),ZinCC,g(7),W(14));
ZinTot=Zin(7)/2;

R=(ZinTot-50)/(ZinTot+50);
SWR=(1+abs(R))/(1-abs(R));
%calculate chebyshev currents

Iin=1/ZinTot;

[Vc,Ic]=twoport(1,Iin/2,Zo(7),g(7),W(14));
I5=Ic*Zin(6)/(Zin(5)+Zin(6));
I6=Ic*Zin(5)/(Zin(5)+Zin(6));

[Va,Ia]=twoport(Vc,I5,Zo(5),g(5),W(12));
I1=Ia*Zin(2)/(Zin(1)+Zin(2));
I2=Ia*Zin(1)/(Zin(1)+Zin(2));

[Vr1,Ir1]=twoport(Va,I1,Zo(1),g(1),W(8));
[Vr2,Ir2]=twoport(Va,I2,Zo(2),g(2),W(9));

[Vb,Ib]=twoport(Vc,I6,Zo(6),g(6),W(13));
I3=Ib*Zin(4)/(Zin(3)+Zin(4));
I4=Ib*Zin(3)/(Zin(3)+Zin(4));

[Vr3,Ir3]=twoport(Vb,I3,Zo(3),g(3),W(10));
[Vr4,Ir4]=twoport(Vb,I4,Zo(4),g(4),W(11));

I(1)=Ir1/Ir4;
I(2)=Ir2/Ir4;
I(3)=Ir3/Ir4;

h=2*real(Zr*(abs(I(1))^2+abs(I(2))^2+abs(I(3))^2+abs(Ir4)^2))/real(ZinTot*(abs(Iin)^2));

z=(max(SWR,1.1)-1.1)+(real(I(1))-I1real)^2+(imag(I(1))-I1im)^2+...
                    (real(I(2))-I2real)^2+(imag(I(2))-I2im)^2+...
                    (real(I(3))-I3real)^2+(imag(I(3))-I3im)^2+...
                    (-min(h,0.85)+0.85);
                

end

function y=InputImpedance(Zo,Zl,g,l)

C=tanh(g*l);
y=Zo*(Zl+Zo*C)/(Zo+Zl*C);

end


function [V2,I2]=twoport(V1,I1,Z,g,L)

Y=1/Z;
A=cosh(g*L);
B=sinh(g*L);
T=[A Z*B;Y*B A];
result=T\[V1;I1];
V2=result(1);
I2=result(2);

end

