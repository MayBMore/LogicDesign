
# Lab 10
#### **리모컨 송신 신호**

> **State**

    parameter	IDLE		= 2'b00	;
	parameter	LEADCODE	= 2'b01	;	// 9ms high 4.5ms low
	parameter	DATACODE	= 2'b10	;	// Custom & Data Code
	parameter	COMPLETE	= 2'b11	;	// 32-bit data

 - IDLE : 기본 상태
 - LEADCODE : Leader Code를 뜻하며, 프레임의 모드를 선택하는 상태로 9ms는 high고 4.5ms는 low다
 - DATACODE : Custom Code와 Data  Code를 합친 상태로, 각각 특정 회사를 나타내는 코드와 송신 데이터 코드를 말한다
 - COMPLETE : 32bit 데이터

> **State Machine**

	

if(rst_n == 1'b0) begin
		state <= IDLE;
		cnt32 <= 6'd0;
	end else begin
		case (state)
			IDLE: begin
				state <= LEADCODE;
				cnt32 <= 6'd0;
rst_n=0일때 IDLE 상태로 리셋한다  
rst_n=1일때 IDLE 상태를 시작하고 LEADCODE 상태로 보낸다

    
			LEADCODE: begin
				if (cnt_h >= 8500 && cnt_l >= 4000) begin
					state <= DATACODE;
				end else begin
					state <= LEADCODE;
				end

LEADCODE를 실행했을 때 cnt_h가 8500 이상이고 cnt_l이 4000 이하면 DATACODE 상태로 보낸다

    DATACODE: begin
				if (seq_rx == 2'b01) begin
					cnt32 <= cnt32 + 1;
				end else begin
					cnt32 <= cnt32;
				end
				if (cnt32 >= 6'd32 && cnt_l >= 1000) begin
					state <= COMPLETE;
				end else begin
					state <= DATACODE;
				end
DATACODE를 실행했을 때 cnt32가 32bit보다 크고 cnt_l이 1000보다 크면 COMPLETE 상태로 보낸다

    COMPLETE: state <= IDLE;
COMPLETE 면 IDLE 상태로 보낸다



#
### FPGA
**waveform**
![](https://github.com/MayBMore/LogicDesign/blob/master/Practice09/waveform.PNG)
**quartus**
![](https://github.com/MayBMore/LogicDesign/blob/master/Practice09/KakaoTalk_20191126_214525954.jpg)
리모컨의 전원버튼을 눌렀을때
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTY5MTk2MzI0LDExNjc4MDQ4MDddfQ==
-->