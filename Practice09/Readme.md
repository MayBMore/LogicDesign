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

#### impluse response
*  Band-pass system에 대한 baseband representation 정의
* 일반 baseband representation과 유사하게 복소수로 표현
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


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQ1MzU0NDgwMywtODUzMTIyNzk3LDkxMT
QxOTQzOCw1NjkxOTYzMjQsMTE2NzgwNDgwN119
-->