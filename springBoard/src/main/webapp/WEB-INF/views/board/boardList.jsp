<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

$j(document).ready(function() {

	//  ��ü üũ�ڽ� üũ
	$j(".allCheck").click(function(){
		if($j(".allCheck").prop("checked")){
			$j(".typeCheck").prop("checked", true);
		} else {
			$j(".typeCheck").prop("checked", false);
		}
	});
		
	//	����üũ�ڽ� ���ý� ��ü ����
	$j(".typeCheck").click(function(){
		
		$j(".allCheck").prop("checked", false);
		
	});
	
	$j("#btnUserLogin").on("click", function(){
		$j(location).attr('href','userLogin.do');
	});
	
	$j("#btnUserJoin").on("click", function(){
		$j(location).attr('href','userJoin.do');
	});
	
//	$j("#btnSearch").on("click", function(){
//		$j("#selectType").submit();
//	});
	
 	$j("#btnSearch").on("click", function(){
 		
 		var emptyCheck = $j('input:checked').val();
 		if(emptyCheck==null){
 			alert("üũ�ʼ�");
 			return false;
 		}
 		
 		
		var $frm = $j("input[class=typeCheck]:checked");
		var param = $frm.serialize();
		
 		
		$j.ajax({
			url : "/board/boardTypeList.do",
			dataType : "json",
			type : "POST",
			data : param,
			success : function(data) {
				console.log("����")
				console.log("��ȸ�� ������ : " + data.list.length)
		    	var trlength = $j('#boardTable tr').length;
		    	console.log("���� ������ : " + (trlength - 1))
		    	// ù�� ���� ROW ����
		    	for(var t=trlength-1; t>0; t--){
		    		boardTable.deleteRow(t);
		    	}
		    	// �����
		    	deleteCnt(data.list.length);
		    	for(var i=0; i<data.list.length; i++){
					$j('#boardTable').append("<tr><td align='center'>" + data.codeMap[data.list[i].boardType] + "</td>" +
												"<td>" + data.list[i].boardNum + "</td>" +
												"<td><a href= \"/board/" + data.list[i].boardType 
														+ "/" + data.list[i].boardNum 
														+ "/boardView.do?pageNo=${pageNo}\">" + data.list[i].boardTitle + "</a></td>");
					
		    		};
			    },
			error : function(jqXHR, textStatus, errorThrown) {
				alert("����");
				}
			});
		});
		
	
		function deleteRow(t){
			$j('boardTable tr').eq(t).remove();
		};
		
		function deleteCnt(t){
/* 			$j("#cntBox").empty();
			$j("#cntBox").append("total : " + t); */
			
			$j("<div id=\"cntBox\">total : "+ t +"</div>").replaceAll("#cntBox");
		};
		
	
	
});
 
</script>
<body>
<table  align="center">
	<tr>
		<td>
			<button type="button" id="btnUserLogin" value="">�α���</button>
			<button type="button" id="btnUserJoin" value="">ȸ������</button>
		</td>
		<td align="right">
			<div class="cntBox" id="cntBox" >total : ${totalCnt}</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<table id="boardTable" border = "1" class="boardTable">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr id="boardListtr">
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<input type="button" value="�۾���" onclick = "location.href = '/board/boardWrite.do'" >
		</td>
	</tr>
	<tr>
		<td align="left" style='padding-left:10px'>
			<form id="selectType" class="selectType" method="POST">
				<label>
					<input type="checkbox" class=allCheck value="">��ü
				</label>
				<c:forEach items="${comCodeList}" var="list">
					<label>
						<input type="checkbox" class=typeCheck name="codeId" value="${list.codeId}">${list.codeName}
					</label>
				</c:forEach>
				<button type="button" id="btnSearch">��ȸ</button>
			</form>
		</td>
	</tr>
</table>	
</body>
</html>