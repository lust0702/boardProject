<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<script type="text/javascript">
	var num = [1,2,3,4,5,6,7,8];
	var sum = 0;
	
 	for(var i = 0; $j(num).length > i; i++){
		if(num[(i-1)]%2==1){
			sum += num[i-1];
			console.log("sum : " + sum + " num : " + num[i-1]);
		}
	}
	console.log($j(num).length);

</script>
<body>
</body>
</html>
