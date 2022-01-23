<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function() {
		var j = 0;
		

		$j("#submit").on("click", function() {
			var param;
			var $frm = $j('.boardWrite :input');
			param = $frm.serialize();
			console.log(decodeURI(param));
			
		
			$j.ajax({
				url : "/board/boardWriteAction1.do",
				dataType : "json",
				type : "POST",
				data : param,
				success : function(data, textStatus, jqXHR) {
					console.log(param);
					alert("작성완료");

					alert("메세지:" + data.success);

					location.href = "/board/boardList.do?pageNo="+data.pageNo;
				},
				error : function(jqXHR, textStatus, errorThrown) {
//					console.log(decodeURI(param));
					console.log(decodeURI(param));
					alert("실패");
				}
			});

		});
		
		$j("#addRow").on("click", function() {
			j++;
//			var obj = $j('#tb > tbody >tr');
//			console.log(obj.size());
//			obj.eq(obj.size() - 1).before
			$j("#copyLocation").before("<tbody id=\"delBox" + j + "\"><tr><td width=\"120\" align=\"center\">Type</td><td width=\"400\" id=\"typeCopy" + j + "\"></td><td rowspan=\'3\' width=\"30\" align=\"center\"><input type=\"checkbox\" id=\"delCheck" + j + "\"></td></tr>"
											+"<tr><td width=\"120\" align=\"center\">Title</td><td width=\"400\"><input name=\"boardWriteList[" + j + "].boardTitle\" type=\"text\" size=\"50\" value=\"${board.boardTitle}\"></td></tr>"
											+"<tr><td height=\"300\" align=\"center\">Comment</td><td valign=\"top\"><textarea name=\"boardWriteList[" + j + "].boardComment\"  rows=\"20\" cols=\"55\">${board.boardComment}</textarea></td></tr></tbody>");
//			$j("#boardWriteList0").clone().appendTo("#typeCopy1");
			$j("#boardWriteList0").clone().prop('name', 'boardWriteList[' + j + '].boardType').appendTo("#typeCopy" + j);
			console.log("jCopy :" +j);
			
		});
		
		$j("#delRow").on("click", function() {
			var checkCnt;
			var rowCnt = ($j('input:checkbox:not(:checked)').length);
			var q;
			
	 		var emptyCheck = $j('input:checked').val();
	 		if(emptyCheck==null){
	 			alert("삭제할 글 선택");
	 			return false;
	 		}
	 		
 			if($j("#delCheck0").is(":checked")==true) {
				alert("기본행 삭제불가")
				return false;
 			} else {
		 		for(var cnt=j; cnt>0;) {
//		 			console.log("cnt : " + cnt);
		 			if($j("#delCheck" + cnt).is(":checked")==true){
			 			$j("#delBox" + cnt).remove();
	 				}
		 			cnt--;
	 			}
		 		
 				for(q=1; q<rowCnt; q++){
 					for(var w=q; w<=j; w++){
 						$j(("#delBox" + w)).attr("id", ("delBox" + q));
 						$j(("#delCheck" + w)).attr("id", ("delCheck" + q));
 						$j(("#typeCopy" + w)).attr("id", ("typeCopy" + q));
						$j("input[name='boardWriteList[" + w + "].boardTitle']").attr("name", "boardWriteList[" + q + "].boardTitle");
						$j("select[name='boardWriteList[" + w + "].boardType']").attr("name", "boardWriteList[" + q + "].boardType");
						$j("textarea[name='boardWriteList[" + w + "].boardComment']").attr("name", "boardWriteList[" + q + "].boardComment");
 					}
				}
 			}
 			j=(q-1);
 			console.log(" j :"+ j)
		});

		
	});
</script>
<body>
<form class="boardWrite">
	<table align="center">
		<tr>
			<td align="right">
				<button type="button" id="addRow">행추가</button>
				<button type="button" id="delRow">행삭제</button>
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1" id="tb"> 
				<tbody id="delBox0">
					<tr>
						<td width="120" align="center" id="test1">
						Type
						</td>
						<td width="400" id="typeCopy">
							<select name="boardWriteList[0].boardType" value="${board.boardType}" id="boardWriteList0">
 								<c:forEach items="${comCodeList}" var="list">
									<option value="${list.codeId}">${list.codeName}</option>
								</c:forEach>
							</select>
						</td>
						<td rowspan='3' width="30" align="center"><input type="checkbox" id="delCheck0"></td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardWriteList[0].boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardWriteList[0].boardComment" rows="20" cols="55" value="${board.boardComment}"></textarea>
						</td>
					</tr>
					</tbody>
					<tbody id="copyLocation">
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						</td>
					</tr>
				</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input id="submit" type="button" value="작성">
				<input type="button" value="목록" onclick = "location.href = '/board/boardList.do'" >
			</td>
		</tr>
	</table>
</form>	
</body>
</html>