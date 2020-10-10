# 03. Wireless Channel and Radio Frequency Processing
## delaySpread

### parameters

<pre>
<code>
%parameters --------------------
length_ht = 1024; % length of channel impulse response 
%delay profile (tau_i or positions of the impulses)
Tp = [2 3 5 6 7 8 9 100];
</code>
</pre>

#### impluse response
*  Band-pass system에 대한 baseband representation 정의
* 일반 baseband representation과 유사하게 복소수로 표현
> h(t) = 2hI(t)cos(2pifct)-2hQ(t)sin(2pifct)


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM0NDY3MDgzNSw1NjkxOTYzMjQsMTE2Nz
gwNDgwN119
-->