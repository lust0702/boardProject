<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">

	$j(document).ready(function() {

		$j("#submit").on("click", function() {

			var deleteCheck = confirm('삭제하시겠습니까?');

			if (deleteCheck == true) {

				var param;
				var $frm = $j('.boardView :input');
				param = $frm.serialize();

				$j.ajax({
					url : "/board/boardDelete.do",
					dataType : "json",
					type : "POST",
					data : param,
					success : function(data, textStatus, jqXHR) {
						alert("삭제완료");

						alert("메세지:" + data.success);

						location.href = "/board/boardList.do?pageNo=1";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("실패");

					}
				});

			}
			;
		});
	});
</script>
<body>
<form class="boardView">
<input type="hidden" name="boardNum" id="boardNum" value="${board.boardNum}"/>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Type
					</td>
					<td width="400">
						${board.codeName}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<input type="button" value="수정" onclick = "location.href = '/board/${board.boardType}/${board.boardNum}/boardModify.do'" >
			<input id="submit" type="button" value="삭제">
			<input type="button" value="목록" onclick = "location.href = '/board/boardList.do'" >
		</td>
	</tr>
</table>
</form>
</body>
</html>