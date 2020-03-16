# counter_7_segment_display
use 7 segment display to display counting numbers<br />
Use a clock with frequency 1 Hz.
Use "if" to control counting numbers.
The numbers change only if 8 7-segment-displays all have been lighten up.
"Persistence of vision" is used to display 8 numbers, because in default all the 8 number should be the same.
However, using Persistence can demonstrate different 8 number.(It is too fast to tell if it is changing)

我只用一個除頻完的clock寫，其中用if 來控制數字變換，只有當八個燈依序亮過後，數字才改變一次。
上數時，當最左邊的七段顯示器enable[7]亮了，才會使得數字加一
if(up==1 && enable[7]==0)begin
					in=in+1;  //in是二進位四位數，用來數0~15
				end
        
下數時，當最左邊的七段顯示器enable[0]亮了，才會使得數字加一
if(enable[0]==0)begin             
					in=in-1; //in是二進位四位數，用來數0~15                                       
				end
至於為何亮了是用0，因為電晶體的關係

[!image](https://github.com/skyMei-J/counter_7_segment_display/blob/master/ddd.png)

