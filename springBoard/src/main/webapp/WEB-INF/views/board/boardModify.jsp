<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardModify</title>
</head>
<script type="text/javascript">

	$j(document).ready(function() {

		$j("#submit").on("click", function() {
			var $frm = $j('.boardModify :input');
			var param = $frm.serialize();

			$j.ajax({
				url : "/board/boardUpdate.do",
				dataType : "json",
				type : "POST",
				data : param,
				success : function(data, textStatus, jqXHR) {
					alert("�����Ϸ�");

					alert("�޼���:" + data.success);

					/* 					location.href = "/board/boardList.do?pageNo="; // ���� �ӽ� ����*/
					location.href = "/board/boardList.do?pageNo=1";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("����");
				}
			});
		});
	});
</script>
<body>
	<form class="boardModify">
		<input type="hidden" name="boardNum" value="${board.boardNum}" />
		<table align="center">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">
							Type
							</td>
							<td width="400">
								<select name="boardType" value="${board.boardType}">
									<c:forEach items="${comCodeList}" var="list">
										<option value="${list.codeId}">${list.codeName}</option>
									</c:forEach>
								</select>
								<%-- 				comCode ���� �ۼ��Ѻκ�
								<select name="boardType" value="${board.boardType}">
								    <option value="a01" selected="selected">�Ϲ�</option>
								    <option value="a02">Q&amp;A</option>
								    <option value="a03">�͸�</option>
								    <option value="a04">����</option>
								</select>
								 --%>
							</td>
						</tr>

						<tr>
							<td width="120" align="center">
							Title
							</td>
							<td width="400">
								<input name="boardTitle" type="text" size="50" value="${board.boardTitle}">
							</td>
						</tr>
						<tr>
							<td height="300" align="center">
							Comment
							</td>
							<td valign="top">
								<textarea name="boardComment" rows="20" cols="55">${board.boardComment}</textarea>
							</td>
						</tr>
						<tr>
							<td align="center">
							Writer
							</td>
							<td>
								<!-- ���� --> <a>����ѹ� Ȯ�ο� : ${board.boardNum}</a> <!-- ������ -->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input id="submit" type="button" value="Ȯ��">
					<input type="button" value="���" onclick="location.href = '/board/boardList.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>