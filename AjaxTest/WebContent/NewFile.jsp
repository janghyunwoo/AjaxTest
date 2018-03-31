<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">

table{

	border-collapse: collapse;

}

td{

	border: #ABF200 solid;

}

</style>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript">

//$("#joinOk").bind("click",function(){
	//function test(){
$(document).ready(function() {
	$("#con").hide();

	$("#b").click(function() {

    $.ajax({
        url : "AjaxController",
        type: "get",
        dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
        data : { 
        	"id" : $("#id").val(),
			"pw" : $("#pw").val()
        },
        
        success : function(data){
        	
        	$("#con").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
        	
			$("<table/>").css({

				backgroundColor : "#E4F7BA",

				border : "solid 3px #E4F7BA",
				
			

			}).appendTo("#con"); // 테이블을 생성하고 그 테이블을 div에 추가함
			
			var key = Object.keys(data["memberlist"][0]); // id , pw , addr , tel 의 키값을 가져옴

			$("<tr>" , {
				

				html : "<td>" + key[0] + "</td>"+  // 컬럼명들

						"<td>" + key[1] + "</td>"+

						"<td>" + key[2] + "</td>"+
						
						"<td>" + key[3] + "</td>"


			}).appendTo("table") // 이것을 테이블에붙임

			$.each(data.memberlist, function(index, memberlist) { // 이치를 써서 모든 데이터들을 배열에 넣음

				var items = [];

				items.push("<td>" + memberlist.id + "</td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤

				items.push("<td>" + memberlist.pw + "</td>");

				items.push("<td>" + memberlist.date + "</td>");
				items.push("<td>" + memberlist.sdate + "</td>");

				
				$("<tr/>", {

					html : items // 티알에 붙임,

				}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임

			});//each끝
           
        }
    });
	});
});
//});


</script>
<body>
<input type="text" id="id" value="gusdn"> 
<input type="text" id="pw" value="620q"> 
<!-- <button id="joinOk" onclick="test()">asdf</button>
<div id="container"></div> -->

<input type="button" id="b" value="회원정보보기">
<div id="con">
</div>
<table>
</table>

</body>
</html>