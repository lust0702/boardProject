<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>
	User Join
</title>
</head>
<script type="text/javascript">
	

	
	$j(document).ready(function() {

		$j("#boardList").on("click", function(){
			$j(location).attr('href','boardList.do');
		});
		
		$j("#test").on("click", function() {
			alert("테스트");
		});
	});

</script>
<body>
<table  align="center">
<form>
	<tr>
		<td>
			<button type="button" id="boardList" value="">목록</button>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<table id="boardTable" border = "1">
				<tr>
					<td width="120" align="center">
						id
					</td>
					<td width="300" align="left">
						<input type="text" size="12">
						<input type="button" id="test" value="중복체크" onclick = "" >
					</td>
				</tr>
				<tr>
					<td align="center">
						pw
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
				<tr>
					<td align="center">
						pw check
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
				<tr>
					<td align="center">
						name
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
				<tr>
					<td align="center">
						phone
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
				<tr>
					<td align="center">
						postNo
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
				<tr>
					<td align="center">
						adress
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
				<tr>
					<td align="center">
						company
					</td>
					<td align="left">
						<input type="text">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<input type="button" value="가입완료" onclick = "location.href = 'boardList.do'" >
		</td>
	</tr>
</form>
</table>
</body>
</html>
