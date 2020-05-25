                                                                                                                                                   set i nodes /1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38/;
set o(i) origin nodes /11,17,27,33,35/;
set d(i) destination nodes /8,10,24,26,38/;
set sign(i) signal control nodes /4,6,14,16,20,22,30,32/;
set dv(i) diverge nodes /34,2,12,18,28/;
set merge(i) merge nodes /1,7,9,23,25/;
set swift(i) common nodes /1,2,3,34,12,15,18,19,28,29/;

scalar kp;
kp=70;
scalar vmin;
vmin=0;
scalar kjam;
kjam=120;



*Option MIP=cplex;
option limcol = 100;
option limrow = 100;


alias (i, j);
alias (i, n);
alias (i, e);
alias (i, u);
alias (i, s);

set all_link(i,j)  linkset;
set link(i,j)      reallink;
set vir_link(i,j)  virset;



all_link('1','2')=1;
all_link('3','4')=1;
all_link('5','6')=1;
all_link('7','8')=1;
all_link('9','10')=1;
all_link('11','12')=1;
all_link('13','14')=1;
all_link('15','16')=1;
all_link('17','18')=1;
all_link('19','20')=1;
all_link('21','22')=1;
all_link('23','24')=1;
all_link('25','26')=1;
all_link('27','28')=1;
all_link('29','30')=1;
all_link('31','32')=1;
all_link('33','34')=1;
all_link('35','36')=1;
all_link('37','38')=1;
all_link('2','3')=1;
all_link('2','5')=1;
all_link('12','15')=1;
all_link('12','13')=1;
all_link('18','21')=1;
all_link('18','19')=1;
all_link('28','29')=1;
all_link('28','31')=1;
all_link('30','9')=1;
all_link('30','7')=1;
all_link('32','23')=1;
all_link('6','25')=1;
all_link('4','9')=1;
all_link('4','23')=1;
all_link('14','7')=1;
all_link('16','25')=1;
all_link('16','23')=1;
all_link('22','9')=1;
all_link('20','7')=1;
all_link('20','25')=1;
all_link('34','1')=1;
all_link('36','1')=1;
all_link('34','37')=1;

link('1','2')=1;
link('3','4')=1;
link('5','6')=1;
link('7','8')=1;
link('9','10')=1;
link('11','12')=1;
link('13','14')=1;
link('15','16')=1;
link('17','18')=1;
link('19','20')=1;
link('21','22')=1;
link('23','24')=1;
link('25','26')=1;
link('27','28')=1;
link('29','30')=1;
link('31','32')=1;
link('33','34')=1;
link('35','36')=1;
link('37','38')=1;

vir_link('2','3')=1;
vir_link('2','5')=1;
vir_link('12','15')=1;
vir_link('12','13')=1;
vir_link('18','21')=1;
vir_link('18','19')=1;
vir_link('28','29')=1;
vir_link('28','31')=1;
vir_link('30','9')=1;
vir_link('30','7')=1;
vir_link('32','23')=1;
vir_link('6','25')=1;
vir_link('4','9')=1;
vir_link('4','23')=1;
vir_link('14','7')=1;
vir_link('16','25')=1;
vir_link('16','23')=1;
vir_link('22','9')=1;
vir_link('20','7')=1;
vir_link('20','25')=1;
vir_link('34','1')=1;
vir_link('36','1')=1;
vir_link('34','37')=1;

parameter length(i,j);
length('1','2')=0.14;
length('3','4')=0.151;
length('5','6')=0.151;
length('7','8')=0.503;
length('9','10')=0.381;
length('11','12')=0.212;
length('13','14')=0.152;
length('15','16')=0.152;
length('17','18')=0.346;
length('19','20')=0.157;
length('21','22')=0.155;
length('23','24')=0.503;
length('25','26')=0.512;
length('27','28')=0.348;
length('29','30')=0.159;
length('31','32')=0.158;
length('33','34')=0.201;
length('35','36')=0.062;
length('37','38')=0.061;
length('2','3')=0.013;
length('2','5')=0.009;
length('12','15')=0.016;
length('12','13')=0.015;
length('18','21')=0.006;
length('18','19')=0.004;
length('28','29')=0.012;
length('28','31')=0.007;
length('30','9')=0.036;
length('30','7')=0.009;
length('32','23')=0.028;
length('6','25')=0.029;
length('4','9')=0.011;
length('4','23')=0.03;
length('14','7')=0.029;
length('16','25')=0.031;
length('16','23')=0.014;
length('22','9')=0.027;
length('20','7')=0.03;
length('20','25')=0.008;
length('34','1')=0.007;
length('36','1')=0.011;
length('34','37')=0.014;
parameter lane(i,j);
lane('1','2')=3;
lane('3','4')=2;
lane('5','6')=1;
lane('7','8')=3;
lane('9','10')=3;
lane('11','12')=3;
lane('13','14')=1;
lane('15','16')=2;
lane('17','18')=3;
lane('19','20')=2;
lane('21','22')=1;
lane('23','24')=3;
lane('25','26')=3;
lane('27','28')=3;
lane('29','30')=2;
lane('31','32')=1;
lane('33','34')=3;
lane('35','36')=1;
lane('37','38')=1;
lane('2','3')=2;
lane('2','5')=1;
lane('12','15')=2;
lane('12','13')=1;
lane('18','21')=1;
lane('18','19')=2;
lane('28','29')=2;
lane('28','31')=1;
lane('30','9')=2;
lane('30','7')=1;
lane('32','23')=1;
lane('6','25')=1;
lane('4','9')=1;
lane('4','23')=2;
lane('14','7')=1;
lane('16','25')=2;
lane('16','23')=1;
lane('22','9')=1;
lane('20','7')=2;
lane('20','25')=1;
lane('34','1')=3;
lane('36','1')=1;
lane('34','37')=1;
parameter satur(i,j);
satur('1','2')=1;
satur('3','4')=0.33;
satur('5','6')=0.17;
satur('7','8')=1;
satur('9','10')=1;
satur('11','12')=1;
satur('13','14')=0.17;
satur('15','16')=0.33;
satur('17','18')=1;
satur('19','20')=0.33;
satur('21','22')=0.17;
satur('23','24')=1;
satur('25','26')=1;
satur('27','28')=1;
satur('29','30')=0.33;
satur('31','32')=0.17;
satur('33','34')=1;
satur('35','36')=1;
satur('37','38')=1;
satur('2','3')=1;
satur('2','5')=1;
satur('12','15')=1;
satur('12','13')=1;
satur('18','21')=1;
satur('18','19')=1;
satur('28','29')=1;
satur('28','31')=1;
satur('30','9')=1;
satur('30','7')=1;
satur('32','23')=1;
satur('6','25')=1;
satur('4','9')=1;
satur('4','23')=1;
satur('14','7')=1;
satur('16','25')=1;
satur('16','23')=1;
satur('22','9')=1;
satur('20','7')=1;
satur('20','25')=1;
satur('34','1')=1;
satur('36','1')=1;
satur('34','37')=1;
parameter left(i,j);
left('1','2')=0;
left('3','4')=0;
left('5','6')=1;
left('7','8')=0;
left('9','10')=0;
left('11','12')=0;
left('13','14')=1;
left('15','16')=0;
left('17','18')=0;
left('19','20')=0;
left('21','22')=1;
left('23','24')=0;
left('25','26')=0;
left('27','28')=0;
left('29','30')=0;
left('31','32')=1;
left('33','34')=0;
left('35','36')=0;
left('37','38')=0;
left('2','3')=0;
left('2','5')=0;
left('12','15')=0;
left('12','13')=0;
left('18','21')=0;
left('18','19')=0;
left('28','29')=0;
left('28','31')=0;
left('30','9')=0;
left('30','7')=0;
left('32','23')=0;
left('6','25')=0;
left('4','9')=0;
left('4','23')=0;
left('14','7')=0;
left('16','25')=0;
left('16','23')=0;
left('22','9')=0;
left('20','7')=0;
left('20','25')=0;
left('34','1')=0;
left('36','1')=0;
left('34','37')=0;
parameter f(i,j);
f(i,j)=55;
parameter w(i,j);
w(i,j)=30;


parameter Q(i,j);
parameter Lr(i,j);
parameter Fs(i,j);
parameter Vr(i,j);
parameter Vaverage(i,j);
parameter Q_limited(i,j)
parameter weighted_Q;
parameter weighted_Q_limited;

parameter v_max(i);
v_max(i)=55;

variable k(i,j);
variable ks(i,j);

variable v(i);

variable z_ul;
variable z_lb;


k.lo(i,j)=0;
k.up(i,j)=kjam;

ks.lo(i,j)=0;
ks.up(i,j)=kjam;

v.lo(i)=0;
*v.lo(i)$(swift(i))=10-kp/kjam*10;
v.lo(i)$(swift(i))=vmin;
v.up(i)=v_max(i);

Equations
obj

Constraints_17_conservation

Constraints_18_speed(i,j)
Constraints_19_speed(i,j)
Constraints_20_speed(i,j)
Constraints_21_speed(i,j)
Constraints_22_speed(i)


Constraints_23_link_density(i,j)
Constraints_24_link_density(i,j)
Constraints_24_1_link_density(i,j)
Constraints_25_link_density(i,j)

Constraints_26_link_stop_density(i,j)
Constraints_27_link_stop_density(i,j)

Constraints_28_29_swift(i,j)
Constraints_28_diveraging(i,j)
Constraints_29_merging(i,j)

Constraints_30_stop_density_upstream_downstream(i,j,u,s)
Constraints_30_density_upstream_downstream(i,j,u,s)

;

obj..z_ul=e=sum((i,j)$link(i,j),ks(i,j)*length(i,j)*lane(i,j));

Constraints_17_conservation..sum((i,j)$link(i,j),lane(i,j)*length(i,j)*k(i,j))=e=kp*sum((i,j)$link(i,j),lane(i,j)*length(i,j));

Constraints_18_speed(i,j)$(link(i,j) and  (not d(j)) and  (not sign(j)))..v(i)=g=v(j);
Constraints_19_speed(i,j)$(link(i,j) and sign(j))..v(j)=g=1/2*f(i,j)*(1+sqrt(satur(i,j)));
*---------------------------------------------------------1/2*f(i,j)*(2-satur(i,j));
Constraints_20_speed(i,j)$(vir_link(i,j) and sign(i))..v(i)=l=v(j);
Constraints_21_speed(i,j)$(link(i,j) and d(j))..v(i)=l=v(j);
Constraints_22_speed(i)$(o(i) or d(i))..v(i)=e=v_max(i);


Constraints_23_link_density(i,j)$(link(i,j) and (not d(j)) and (not sign(j)))..k(i,j)=l=kjam-1*kjam/f(i,j)*v(j);
Constraints_24_link_density(i,j)$(link(i,j) and (not d(j)))..k(i,j)=g=kjam-1*kjam/f(i,j)*v(i);
Constraints_24_1_link_density(i,j)$(link(i,j) and sign(j)).. k(i,j)=g=kjam-1*kjam/f(i,j)*1/2*(v(i)+v(j));
Constraints_25_link_density(i,j)$(link(i,j) and d(j))..k(i,j)=e=kjam-1*kjam/f(i,j)*1/2*(v(i)+v(j));


Constraints_26_link_stop_density(i,j)$(link(i,j)).. ks(i,j)=l=k(i,j);
Constraints_27_link_stop_density(i,j)$(link(i,j)).. ks(i,j)=g=k(i,j)-(kjam-1*kjam/f(i,j)*1/2*(v(i)+v(j)));

Constraints_28_29_swift(i,j)$(vir_link(i,j) and swift(i) and swift(j) and (not sign(i)))..v(i)=e=v(j);
Constraints_28_diveraging(i,j)$(vir_link(i,j) and dv(i) and (not sign(i)))..v(i)=l=v(j);
Constraints_29_merging(i,j)$(vir_link(i,j) and merge(j) and (not sign(i)))..v(i)=l=v(j);


Constraints_30_stop_density_upstream_downstream(i,j,u,s)$(link(i,j) and vir_link(j,u) and link(u,s) and (not sign(j)) and swift(j) and swift(u) and (not d(s)))..ks(i,j)=l=ks(u,s);
Constraints_30_density_upstream_downstream(i,j,u,s)$(link(i,j) and vir_link(j,u) and link(u,s) and (not sign(j)) and swift(j) and swift(u) and (not d(s)))..k(i,j)=l=k(u,s);


Model paper_model /all/ ;
Solve paper_model using LP minimizing z_ul;
display z_ul.l,k.l,ks.l,v.l;



Fs(i,j)$(link(i,j) and k.l(i,j)>0)=ks.l(i,j)/k.l(i,j);
Fs(i,j)$(link(i,j) and k.l(i,j)<=0)=0;


parameter reduction_factor(i,j);
reduction_factor(i,j)=1.1-0.1*lane(i,j);

Q_limited(i,j)$(link(i,j))=kjam*v.l(j)-kjam/f(i,j)*v.l(j)*v.l(j);
Q_limited(i,j)$(link(i,j))=Q_limited(i,j)*lane(i,j)*reduction_factor(i,j);

weighted_Q_limited=sum((i,j)$(link(i,j)),Q_limited(i,j)*length(i,j))/sum((i,j)$(link(i,j)),lane(i,j)*length(i,j));


display  Fs, weighted_Q_limited;


parameter model_status;
model_status=paper_model.modelStat;
display  model_status;


