   �      'http://www.arm9home.net/js/picplayer.js    ����� %|�P         
     O K           �      Content-Type   application/x-javascript   Content-Encoding   gzip   Last-Modified   Fri, 01 Nov 2013 05:06:26 GMT   Accept-Ranges   bytes   ETag   "0f5a81dc0d6ce1:0"   Vary   Accept-Encoding   Server   Microsoft-IIS/7.5   X-Powered-By   ASP.NET var Timer = null;
var CurScreen = MaxScreen = 1;
function pwSlidePlayer(action,index,maxNum) {
	clearTimeout(Timer);
	if (typeof maxNum != 'undefined')MaxScreen = maxNum;
	switch (action) {
		case 'pause' :
			clearTimeout(Timer);
			break;
		case 'goon' :
			clearTimeout(Timer);
			Timer = setTimeout('pwSlidePlayer();', 3000);
			break;
		case 'play' :
			CurScreen = index - 1 ;
		default :
			if (CurScreen >= MaxScreen)CurScreen = 0 ;
			for (i=0;i<MaxScreen;i++) {
				getObj("Switch_"+i).style.display = "none" ;
			}
			getObj("Switch_"+CurScreen).style.display = "block" ;
			var NavStr = "" ;
			for (i=1;i<=MaxScreen;i++) {
				if (i == CurScreen+1) {
					NavStr += '<li><a href="javascript:;" target="_self" class="sel">'+i+'</a></li>' ;
				} else {
					NavStr += '<li onclick="pwSlidePlayer(\'play\','+i+');"><a href="javascript:;" target="_self">'+i+'</a></li>' ;
				}
			}
			getObj("SwitchNav").innerHTML = NavStr ;
			if (MaxScreen>1) {
				CurScreen++;
				Timer = setTimeout('pwSlidePlayer();', 3000);
			}
	}
}