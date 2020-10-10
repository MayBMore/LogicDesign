# 03. Wireless Channel and Radio Frequency Processing
## delaySpread

### parameters

<pre>
<code>%parameters --------------------
length_ht = 1024; % length of channel impulse response 
%delay profile (tau_i or positions of the impulses)
Tp = [2 3 5 6 7 8 9 100];</code>
</pre>

> * ht의 length를 1024로 설정함
> * time delay spread에 따라 그래프가 달라짐

>참조 개념 : impluse response
>*  Band-pass system에 대한 baseband representation 정의
>* 일반 baseband representation과 유사하게 복소수로 표현
> h(t) = 2hI(t)cos(2pifct)-2hQ(t)sin(2pifct)

### generating impulse response
<pre>
<code>%generating impulse response
ht = zeros(1,length_ht);
ht(Tp) = ones(1,length(Tp));</code>
</pre>

> * ht 벡터를 1부터 ht의 길이만큼(=1024) 0으로 채운 것으로 정의
> * ht(Tp) 벡터를 1부터 ht(Tp) 길이만큼 (=8) 1로 채운 것으로 정의

### frequency response graph
<pre>
<code>%frequency response graph
H = fft(ht,length_ht);
H = [H(length_ht/2+1:length_ht) H(1:length_ht/2)];
figure(100);
plot(abs(H));</code>
</pre>

>*  ht와 length_ht를 fourier 한 것을 H로 정의
>*  H 벡터를 반 잘라 앞의 것은 뒤로, 뒤의 것은 앞으로 붙여서 새로운 H 벡터를 만듦 (wrap around)
> * figure(100) : 그래프 창 생성
> * plot(abs(H)) : H의 절댓값한 그래프를 그려라.

***
### 포인트
* Tp 간격을 늘리면(줄이면) 그래프가 어떻게 바뀌는가
* Tp 첫번째와 마지막 숫자를 바꾸면 그래프가 어떻게 바뀌는가
* Tp element의 수를 바꾸면 그래프가 어떻게 바뀌는가 
***
## RF sim

### parameter configuration

<pre>
<code>%parameter configuration ---------------------------
Tsym = 1;                   % symbol duration (s)
Nsym = 10;                  % number of symbols
fs = 1000;                  % sampling rate (Hz)
fc = 10;                    % carrier frequence
fe = 0;                     % frequency offset

Tmax = Tsym*Nsym;           % simulation time (s)
t = [1/fs : 1/fs : Tmax];   % time vector
N_subFig = 6;</code>
</pre>

> * t : 1/fs에서 Tmax까지 1/fs만큼 증가하는 벡터를 만들라
> N_subFig : 그래프 그릴 때 설정한 변수

### TX
#### baseband signal generation
<pre>
<code>%0. baseband signal generation
bbSym = (1/sqrt(2)) * ( (2*randi(2,1,Nsym)-3) + j*(2*randi(2,1,Nsym)-3));

bbInput = zeros(1,length(t));
for i = 1 : Nsym
    bbInput(Tsym*fs*(i-1)+1) = bbSym(i);
end</code>
</pre>

> * randi : random 함수. 1xNsym벡터에 2가 최대인 난수 발생
> > bbSym이 왜 저런 함수를 가졌지
> 
> 1부터 t의 길이만큼 0을 가지는 벡터 bbInput 정의
> > bbSym(i)를 bbInput에 저장

> *참고 개념 : Baseband*
> * low pass
> * fc term 없음 -> 간단
> * 복소수로 간단하게 표현 가능
> * s(t)는 주파수 대역이 fc+W에 이르는 반면, s(t) tilt는 W가 최대 주파수

#### DAC
<pre>
<code>%1. DAC
reconstFilter = ones(1,Tsym*fs);</code>
</pre>
> *참조 개념 : ADC/DAC*
sampling + Quantization

#### filter & bbInput convolution
<pre>
<code>%filter & bbInput convolution
bbsignal = conv(bbInput, reconstFilter);
bbsignal = bbsignal(1:length(t));

figure(1);
subplot(N_subFig,1,1);
plot(t,bbInput);
subplot(N_subFig,1,2);
plot(t,real(bbsignal));
subplot(N_subFig,1,3);
plot(t,imag(bbsignal));</code>
</pre>

> * baseband signal을 알 수 있음
> > * subplot 1 : bbInput
> >* subplot 2 : bbInput의 실수부
> > * subplot 3 : bbInput의 허수부

#### up-conversion
<pre>
<code>%2. up-conversion
RFsignal = real(bbsignal).*cos(2*pi*fc*t) - imag(bbsignal).*sin(2*pi*fc*t);

subplot(N_subFig,1,4);
plot(t,RFsignal);</code>
</pre>
> * RF signal(bandpass signal)을 알 수 있음
> > * subplot 4 : RFsignal
>* TX에서 up-conversion (RX에서 down-conversion)
> * .*은 요소별 곱

> *참고 개념 : Mixer*
> 다른 주파수로 평행이동 (frequency translation)

### RX
> *참고 자료 : RX단 구조*
> linear detector + sampling + hard decision

#### coherent detection
<pre>
<code>%3. coherent detection
Ich = RFsignal .*cos(2*pi*(fc+fe)*t);
Qch = RFsignal .*sin(2*pi*(fc+fe)*t);

subplot(N_subFig,1,5);
plot(t,Ich);
subplot(N_subFig,1,6);
plot(t,Qch);</code>
</pre>

> * TX에서 보낸 RFsignal을 I-channel과 Q-channel로 분리해서 받음
>  * I-channel과 Q-channel을 알 수 있음
>  > * subplot 1.5 : I-channel
>  > * subplot 1.6 : Q-channel

> *참고자료*
> * Linear Detector g(t)
	> 	* noise 대비 수신 성능 개선을 위한 사전 filtering 처리
	>	* SNR 극대화되는 impulse response g(t)
	>		*	symbol = 1 : y 최대화
	>		* symbol = 0 : y 최소화
	>* Matched Filter
	> SNR을 최대로 만들어주는 linear detector
	> ```
	>g(tau-t) = c*s(t)
	> -> SNR을 최대화 하는 g(t) 조건   
	> c : normalization factor
	> Y : matched filter의 출력
> ```
>	

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTQ5NDQ0NDg5NCwyMzE1NzA5OTAsLTg1Mz
EyMjc5Nyw5MTE0MTk0MzgsNTY5MTk2MzI0LDExNjc4MDQ4MDdd
fQ==
-->