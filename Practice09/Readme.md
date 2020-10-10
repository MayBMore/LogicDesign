# 03. Wireless Channel and Radio Frequency Processing
## delaySpread

### parameters

<pre>
<code>%parameters --------------------
length_ht = 1024; % length of channel impulse response 
%delay profile (tau_i or positions of the impulses)
Tp = [2 3 5 6 7 8 9 100];
</code>
</pre>

> h(t)의 length를 1024로 설정함
> time delay spread에 따라 그래프가 달라짐

#### impluse response
*  Band-pass system에 대한 baseband representation 정의
* 일반 baseband representation과 유사하게 복소수로 표현
> h(t) = 2hI(t)cos(2pifct)-2hQ(t)sin(2pifct)

### generating impulse response
<pre>
<code>%generating impulse response
ht = zeros(1,length_ht);
ht(Tp) = ones(1,length(Tp));
</code>
</pre>

> h(t) 벡터를 1부터 h(t)의 길이만큼(=1024) 0으로 채운다
> h(t)에 time delay를 넣은  벡터를 1부터 

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM3ODM4MDY3Myw1NjkxOTYzMjQsMTE2Nz
gwNDgwN119
-->