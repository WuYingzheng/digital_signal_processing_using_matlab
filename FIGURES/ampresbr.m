% Chapter 7: Bartlett (triangular) Window Amplitude Response

%

M = 45; alpha = (M-1)/2;

n = -alpha:alpha;

w = (bartlett(M))'; sumw = sum(w);

N = 1000; omega = (2*pi/N)*[-N/2:N/2];

Wr = real(w*(exp(-j*n'*omega)));

db = 20*log10(abs(Wr)/max(Wr));

IntWr = cumsum(Wr);

Intdb = 20*log10(abs(IntWr)/N);

k = (N/2+1) - min(find(Intdb > -25));

tr_width = 2*k*2*M/N, %actual transition width in pi/M units

omega1 = -(tr_width/2)/M; omega2 = (tr_width/2)/M;

%

% plots

subplot(1,1,1)

subplot(2,2,1); stem(n,w);

axis([-(alpha+8),(alpha+8),-0.1,1.1]);

set(gca,'YTickMode','manual','YTick',[0,1])

set(gca,'XTickMode','manual','XTick',[-22,0,22]);

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0';'22';'45']);

title('Triangular Window : M=45')

xlabel('n'); ylabel('w(n)')

subplot(2,2,3); plot(omega/pi,Wr);

axis([-1,1,-5,30]);

set(gca,'YTickMode','manual','YTick',[0,sumw])

set(gca,'XTickMode','manual','XTick',[-1,0,1]); grid

title('Amplitude Response')

xlabel('frequency in pi units'); ylabel('Wr')

subplot(2,2,2); plot(omega/pi,db);

axis([-1,1,-60,10]);

set(gca,'YTickMode','manual','YTick',[-60,-27,0])

set(gca,'YTickLabelMode','manual','YTickLabels',['60';'27';' 0'])

set(gca,'XTickMode','manual','XTick',[-1,0,1]);grid

title('Amplitude Response in dB')

xlabel('frequency in pi units'); ylabel('Decibels')

subplot(2,2,4); plot(omega/pi,Intdb);

axis([-1,1,-60,10]);

set(gca,'YTickMode','manual','YTick',[-60,-26,0])

set(gca,'YTickLabelMode','manual','YTickLabels',['60';'26';' 0'])

set(gca,'XTickMode','manual','XTick',[-1;omega1;omega2;1]);grid

set(gca,'XTickLabelMode','manual','XTickLabels',['-1';'  ';'  ';' 1'])

title('Accumulated Amplitude Response')

xlabel('frequency in pi units'); ylabel('Decibels')

text(omega2,5,'Width=(6.1)*pi/M')

